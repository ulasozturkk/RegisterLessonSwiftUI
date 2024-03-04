

import SwiftUI

struct GradeEntryView: View {
  @StateObject var VM = GradeEntryViewViewModel()
  @State private var showingAlert = false
  var body: some View {
    NavigationStack {
      VStack {
        CustomText(text: "Choose a Lesson", color: Color.black, font: .title, fontWeight: .bold)

        Form {
          Picker("Choose a lesson", selection: $VM.selectedLesson) {
            ForEach(VM.lessonList, id: \.name) { lesson in
              Text(lesson.name ?? "error")
            }
          }
        }.onAppear {
          VM.fetchLessons()
        }
        CustomTextField(text: $VM.lessonGrade, placeholder: "Enter Grade")

        CircularButton(text: "Save", action: {
          let result = VM.enterGrade(selectedLesson: VM.selectedLesson!)
          if result == true {
            showingAlert = true
          }
          
        }, backGroundColor: .orange)
        .alert("Success", isPresented: $showingAlert) {
          Button("OK",role: .cancel){
            
          }
        } message: {
          Text("Grade Entered Successfully")
        }

      }
    }
  }
}

#Preview {
  GradeEntryView()
}
