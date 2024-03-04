import Foundation

class LessonListViewViewModel : ObservableObject {
  @Published var lessonlist : [Lesson] = []
  
  func fetchLessons(){
    
    let context = PersistenceController.shared.container.viewContext
    
    if let currentUser = SessionManager.shared.currentUser {
      if let userLessons = currentUser.lessons {
        let lessons = Array(userLessons) as! [Lesson]
        lessonlist = lessons
      }
    }
  }
}
