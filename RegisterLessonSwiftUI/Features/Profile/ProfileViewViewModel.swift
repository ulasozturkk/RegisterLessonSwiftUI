
import Foundation
import SwiftUI

class ProfileViewViewModel : ObservableObject {
  @Published var comment  = ""
  @Published var images: [Image?] = []
  @Published var avatars: [Data]? = []
  
  
  
  
}
