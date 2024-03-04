

import Foundation
import CoreData

class SignInViewViewModel: ObservableObject {
  @Published var username = ""
  @Published var password = ""
  @Published var errorMessage = ""
  
  func signIn() ->Bool{
    guard validateTextFields() == true else {return false}
    
    let context = PersistenceController.shared.container.viewContext
    let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "username == %@",username)
    
    do {
      let users = try context.fetch(fetchRequest)
      guard let user = users.first else {
        errorMessage = "user not found"
        return false
      }
      if user.password == password {
        SessionManager.shared.loginUser(user: user)
        return true
      } else {
        errorMessage = "wrong password!"
        return false
      }
      
    }catch{}
    return false
  }
  
  
  
  func validateTextFields() ->Bool {
    
    guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
          !password.trimmingCharacters(in: .whitespaces).isEmpty
    else {
      errorMessage = "Fields must not be empty!"
      return false
    }
    
    return true
    
  }
}

