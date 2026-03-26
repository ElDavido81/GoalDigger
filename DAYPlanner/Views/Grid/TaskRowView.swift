import SwiftUI

struct TaskRowView: View {
    
    @ObservedObject var tm: TaskManager
    @EnvironmentObject var callManager: CallManager
    var task: Task
    
    var body: some View {
        HStack {
            // Checkbox
            Button(action: {
                guard let index = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) else { return }
                
                // Toggle lokalt först
                tm.incompleteTasks[index].taskStatus.toggle()
                let newStatus = tm.incompleteTasks[index].taskStatus
                
                // Skicka PATCH till backend
                callManager.updateTaskStatus(taskId: task.id, status: newStatus) { result in
                    DispatchQueue.main.async {
                        switch result {
                            case .success():
                                // Om tasken markerad som klar → ta bort från listan
                                if newStatus, let removeIndex = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) {
                                    tm.incompleteTasks.remove(at: removeIndex)
                                    tm.lazyLiquid += 1
                                print("LazyLiquid: \(tm.lazyLiquid)")
                            }
                        case .failure(let error):
                            print("Fel vid uppdatering: \(error.localizedDescription)")
                            // Återställ status om det misslyckas
                            if let restoreIndex = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) {
                                tm.incompleteTasks[restoreIndex].taskStatus.toggle()
                            }
                        }
                    }
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 24, height: 24)
                    if task.taskStatus {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            // Task titel
            Text(task.taskTitle)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding(10)
        .background(Color(hex: "444444"))
        .cornerRadius(8)
    }
}
