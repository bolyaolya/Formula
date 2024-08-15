//
//  CloudStorageService.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import UIKit
import FirebaseStorage

final class CloudStorageService {
    private let storage = Storage.storage()
    private let jsonDecoder = JSONDecoder()
    
    func downloadFile(pathString: String) async throws -> Data {
        return try await storage.reference(withPath: pathString).data(maxSize: 1 * 1024 * 1024)
    }
    
    func fetchDriverImage(image: UIImage, driverID: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let storageRef = Storage.storage().reference().child("drivers/\(driverID).jpg")
        if let imageData = image.jpegData(compressionQuality: 0.6) {
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            storageRef.putData(imageData, metadata: metadata) { _, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                storageRef.downloadURL { url, error in
                    if let url = url {
                        completion(.success(url))
                    } else if let error = error {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}

enum CloudStorageServiceError: Error {
    case unexpectedEmptyMetadata
    case imageDidNotUpdate
    case failedToRemoveFile
}
