import Foundation

class SettingsViewViewModel : ObservableObject {
  
  @Published var lessonName : String = ""
  @Published var errorMessage : String = ""

  
  
  
  
  func addLesson() ->Bool{
    guard validateTextField() == true else {
      return false
    }
    
    guard let currentUser = SessionManager.shared.currentUser else {return false}
    
    guard !((currentUser.lessons?.first(where: {($0 as? Lesson)?.name == lessonName}) as? Lesson) != nil) else {
      errorMessage = "Lesson already exist"
      return false
    }
    let context = PersistenceController.shared.container.viewContext
    let newLesson = Lesson(context: context)
    newLesson.name = lessonName
    currentUser.addToLessons(newLesson)
    do{
      try context.save()
      return true
    }catch{}
    return false
  }
  func validateTextField() ->Bool {
    
    guard !lessonName.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "This field must not be empty!"
      return false
    }
    return true
  }
}
