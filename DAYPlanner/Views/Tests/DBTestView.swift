import SwiftUI

struct DBTestView: View {
    @State private var responseMessage: String = "Väntar på svar..."
    private let callManager = CallManager()
    
    var body: some View {
        VStack {
            Text(responseMessage)
                .padding()
            
            Button(action: {
                callManager.getTasks{
                    let incompleteTitles = callManager.getIncompleteTasks()
                    responseMessage = incompleteTitles.joined(separator: ", ")
                }
            }) {
                Text("Hämta data")
            }
            .padding()
        }
    }
    
}
#Preview {
    DBTestView()
}
