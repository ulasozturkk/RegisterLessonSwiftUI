

import Foundation
import Alamofire

class DownloadManager {
  static let shared = DownloadManager()
  private init(){}
  
  func downloadImages(url: URL,completion: @escaping (Data?)->Void) {
    AF.request(url).responseData { response in
      switch response.result {
      case .success(let data):
        completion(data)
      case .failure(let error):
        completion(nil)
      }
    }
  }
}
