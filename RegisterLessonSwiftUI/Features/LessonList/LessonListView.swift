

import SwiftUI

struct LessonListView: View {
  let sh = UIScreen.main.bounds.height
  let sw = UIScreen.main.bounds.width
  @StateObject private var VM = LessonListViewViewModel()
    var body: some View {
      VStack {
        CustomText(text: "Lesson List", color: Color.black, font: .title, fontWeight: .bold)
        
        List {
          ForEach(VM.lessonlist,id: \.self) { lesson in
            ZStack(alignment:.leading){
              RoundedRectangle(cornerRadius: 12)
                .frame(width: sw * 0.9,height: sh * 0.1)
                .buttonStyle(.bordered)
                .foregroundColor(.white)
              VStack(alignment:.leading){
                CustomText(text: "Lesson Name: \(lesson.name!)", color: Color.black, font: .subheadline, fontWeight: .bold)
                CustomText(text: "Grade: \(lesson.grade)", color: Color.black, font: .subheadline, fontWeight: .medium)
              }.padding()
            }
          }
          
        }.onAppear {
          VM.fetchLessons()
        }
      }
    }
}

#Preview {
    LessonListView()
}
