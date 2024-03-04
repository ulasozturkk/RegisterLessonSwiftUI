
import Foundation

class CacheManager {
  static let shared = CacheManager()
  private init(){}
  
  func createDirectory(){
    let manager = FileManager.default
    
    guard let cachePathURL = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {return}
    
    try? manager.createDirectory(at: cachePathURL, withIntermediateDirectories: true)
  }
  
  func writeDataToCache(dataName: String , data: Data){
    createDirectory()
    let manager = FileManager.default
    guard let cachePathURL = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {return}
    
    let fileURL = cachePathURL.appendingPathComponent(dataName)
    
    if manager.fileExists(atPath: fileURL.path) == true {
      try? data.write(to: fileURL)
    }else {
      manager.createFile(atPath: fileURL.path, contents: nil)
      try? data.write(to: fileURL)
    }
  }
  
  func readDataFromDirectory(dataName: String) -> Data? {
    let manager = FileManager.default
    guard let cachePathURL = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
    
    let fileURL = cachePathURL.appendingPathComponent(dataName)
    
    if manager.fileExists(atPath: fileURL.path) == true {
      do {
        let data = try Data(contentsOf: fileURL)
        return data.isEmpty ? nil : data
      }catch{
        return nil
      }
    } else {
      return nil
    }
  }
}
