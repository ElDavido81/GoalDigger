import SwiftUI

struct TaskRowView: View {
    
    @ObservedObject var tm: TaskManager
    @EnvironmentObject var callManager: CallManager
    var task: Task
    
    var body: some View {
        HStack {
            Button(action: {
                guard let index = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) else { return }
                
                tm.incompleteTasks[index].taskStatus.toggle()
                let newStatus = tm.incompleteTasks[index].taskStatus
                
                callManager.updateTaskStatus(taskId: task.id, status: newStatus) { result in
                    DispatchQueue.main.async {
                        switch result {
                            case .success():
                                if newStatus, let removeIndex = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) {
                                    tm.incompleteTasks.remove(at: removeIndex)
                                    tm.lazyLiquid += 1
                                print("LazyLiquid: \(tm.lazyLiquid)")
                            }
                        case .failure(let error):
                            print("Fel vid uppdatering: \(error.localizedDescription)")
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
            
            Button(action: {
                callManager.snoozeTask(taskId: task.id, currentGoalDateString: task.goalDate) { result in
                    switch result {
                        case .success():
                        if let index = tm.incompleteTasks.firstIndex(where: { $0.id == task.id }) {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd"
                            if let currentDate = formatter.date(from: tm.incompleteTasks[index].goalDate) {
                                let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
                                tm.incompleteTasks[index].goalDate = formatter.string(from: nextDay)
                            }
                        }

                        tm.lazyLiquid -= 1
                        print("\(tm.lazyLiquid)")

                        case .failure(let error):
                            print("Error moving task:", error.localizedDescription)
                    }
                }
            }) {
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .background(Color.blue.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .opacity(tm.lazyLiquid > 0 ? 1 : 0)
            .buttonStyle(PlainButtonStyle())
            
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
