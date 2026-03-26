import SwiftUI

struct QuarterView: View {
    
    @ObservedObject var tm: TaskManager
    let quarterIndex: Int
    
    let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    var calendar = Calendar.current
    
    var startDate: Date { Date() }
    
    var endDate: Date {
        switch quarterIndex {
        case 0: return calendar.date(byAdding: .month, value: 1, to: startDate) ?? startDate
        case 1: return calendar.date(byAdding: .month, value: 3, to: startDate) ?? startDate
        case 2: return calendar.date(byAdding: .month, value: 6, to: startDate) ?? startDate
        default: return startDate
        }
    }
    
    var prevEndDate: Date {
        switch quarterIndex {
        case 0: return startDate
        case 1: return calendar.date(byAdding: .month, value: 1, to: startDate) ?? startDate
        case 2: return calendar.date(byAdding: .month, value: 3, to: startDate) ?? startDate
        default: return startDate
        }
    }
    
    var body: some View {
        VStack(spacing: 2) {
            
            ForEach(
                Array(
                    tm.incompleteTasks
                        .filter { task in
                            guard let goalDate = formatter.date(from: task.goalDate) else { return false }
                            return goalDate > prevEndDate && goalDate <= endDate
                        }
                        .sorted { $0.createdAt > $1.createdAt }
                        .prefix(3)
                ),
                id: \.id
            ) { task in
                TaskView(task: task)
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
