//
//  ImageRepository.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

// ImageRepository.swift

import Foundation

protocol ImageRepositoryProtocol {
    func add(imageData: Data, imageID: String) throws
    func getImageFromCache(idImage: String) -> Data?
    func fetchImageData(imageID: String, path: String) async throws -> Data
}

final class ImageRepository {
    private let imagesCache = NSCache<NSString, NSData>()
    private let cloudStorageService = CloudStorageService()
    private let fileManager: FileManagerServiceProtocol = FileManagerService()
}

extension ImageRepository: ImageRepositoryProtocol {
    
    func add(imageData: Data, imageID: String) throws {
        imagesCache.setObject(imageData as NSData, forKey: imageID as NSString)
        
        guard let _ = imagesCache.object(forKey: imageID as NSString) else {
            print("Failed to add image data to cache for ID: \(imageID)")
            throw ImageRepositoryError.unsuccessfulAdditionToCache
        }
    }
    
    func getImageFromCache(idImage: String) -> Data? {
        if let imageData = imagesCache.object(forKey: idImage as NSString) {
            return imageData as Data
        } else {
            return nil
        }
    }
    
    func fetchImageData(imageID: String, path: String) async throws -> Data {
        
        if let imageData = getImageFromCache(idImage: imageID) {
            return imageData
        } else {
            let imageData = try await cloudStorageService.downloadFile(pathString: path)
            try add(imageData: imageData, imageID: imageID)
            try fileManager.addImageData(imageData, imageID)
            
            return imageData
        }
    }
    
    enum ImageRepositoryError: Error {
        case unsuccessfulAdditionToCache
    }
}
