
import Alamofire
import Foundation
import SwiftUI

class ProfileViewViewModel: ObservableObject {

  @Published var selectedImage : Image?
  @Published var imageIDList : [UUID] = []
  @Published var images: [Image] = []
  @Published var avatars: [Data]? = []
  
  func setImageList(urlList: [URL]) {
    for (index, url) in urlList.enumerated() {
      readOrDownloadImages(url: url, imageName: String(index))
    }
    
    if let avatars = avatars {
      for data in avatars {
        ImageSetterManager.shared.loadImage(data: data) { image in
          if let image = image {
            self.images.append(image)
            
          }
        }
      }
    }
  }
  
  func readOrDownloadImages(url: URL, imageName: String) {
    ImageSetterManager.shared.setImage(url: url, imageName: imageName) { data in
      if let data = data {
        self.avatars?.append(data)
      }
    }
  }
  
  func saveUserImage(index: Int){
    let context = PersistenceController.shared.container.viewContext
    if let user = SessionManager.shared.currentUser {
      user.avatar = self.avatars![index]
    }
  }
  func loadUserImage(){
    if let imageData = SessionManager.shared.currentUser?.avatar {
      ImageSetterManager.shared.loadImage(data: imageData) { image in
        self.selectedImage = image
      }
    }
  }
}
