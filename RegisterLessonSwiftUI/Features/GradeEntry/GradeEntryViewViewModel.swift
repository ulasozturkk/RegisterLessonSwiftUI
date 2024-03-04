

import Foundation
import CoreData

class GradeEntryViewViewModel : ObservableObject {
  
  @Published var lessonList : [Lesson] = []
  @Published var selectedLesson : String?
  @Published var lessonGrade : String = ""
  @Published var pickedLesson: Lesson?
  func enterGrade(selectedLesson : String) ->Bool{
    guard let currentUser = SessionManager.shared.currentUser else {return false}
    guard let userLessons = currentUser.lessons else {return false}
    let context = PersistenceController.shared.container.viewContext
    let lessons = Array(userLessons) as! [Lesson]
    for lesson in lessons {
      if lesson.name == selectedLesson {
        pickedLesson = lesson
        if let doubleGrade = Double(lessonGrade) {
          pickedLesson!.grade = doubleGrade
          try! context.save()
          return true
        }
      }
    }
    
    
    return false
  }
  
  func fetchLessons(){
    guard let currentUser = SessionManager.shared.currentUser else {return}
    guard let userLessons = currentUser.lessons else {return}
    
    let lessons = Array(userLessons) as! [Lesson]
    let sortedLessons = lessons.sorted {$0.name?.localizedCaseInsensitiveCompare($1.name ?? "") == .orderedAscending}
    lessonList = sortedLessons
    selectedLesson = lessonList.first?.name

  }
}
