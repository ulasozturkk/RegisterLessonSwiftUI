import Foundation
import UIKit
import SwiftUI

class ImageSetterManager {
  static let shared = ImageSetterManager()
  private init(){}
  
  func setImage(url:URL,imageName:String,completion: @escaping (Data?)->Void) {
    let data = CacheManager.shared.readDataFromDirectory(dataName: imageName)
    if data != nil {
      completion(data)
    } else {
      DownloadManager.shared.downloadImages(url: url) { data in
        if let data = data {
          CacheManager.shared.writeDataToCache(dataName: imageName, data: data)
          completion(data)
        }
      }
    }
  }
  func loadImage(data: Data,completion: (Image?)->Void) {
    guard let uiImage = UIImage(data: data) else {return}
    let swiftUIImage = Image(uiImage: uiImage)
    completion(swiftUIImage)
  }
}
