
import SwiftUI

struct SettingsView: View {
  @StateObject var VM = SettingsViewViewModel()
  @State var showingAlert = false
    var body: some View {
      NavigationStack {
        VStack(alignment:.center) {
          Spacer()
          
          VStack(alignment:.leading ){
            if VM.errorMessage != "" {
              CustomText(text: VM.errorMessage, color: Color.red, font: .title, fontWeight: .bold)
            }
          
            CustomText(text: "Lesson Name", color: Color.black, font: .subheadline, fontWeight: .medium)
            CustomTextField(text: $VM.lessonName , placeholder: "Enter Lesson Name")
          }
          Spacer()
          CircularButton(text: "Enter Lesson", action: {
            let lessonResult = VM.addLesson()
            if lessonResult == true {
              showingAlert = true
            }
          }, backGroundColor: .orange)
          .alert("Success", isPresented: $showingAlert) {
            Button("OK",role: .cancel){}
          } message: {
            Text("Lesson entered Successfully")
          }

          
        }.navigationTitle("Add Lesson")
      }
    }
}

#Preview {
    SettingsView()
}
