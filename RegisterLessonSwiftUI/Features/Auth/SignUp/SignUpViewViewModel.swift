

import Foundation

class SignUpViewViewModel : ObservableObject {
  @Published var username = ""
  @Published var password = ""
  @Published var confirmPassword = ""
  @Published var errorMesage = ""
  
  init(){}
  
  func signUp() -> Bool{
    guard validateTextFields() == true else {
      return false
    }
    
    let context = PersistenceController.shared.container.viewContext
    let newUser = User(context: context)
    newUser.username = username
    newUser.password = password
    do{
      try context.save()
      return true
    }catch{}
    return false
  }
  
  func validateTextFields() -> Bool {
    errorMesage = ""
    
    guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty,
          !confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty
    else {
      errorMesage = "Fields must not be empty!"
      return false
    }
    
    guard password == confirmPassword else {
      errorMesage =  "Passwords don't match "
      return false
    }
    return true
  }
}
