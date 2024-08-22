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
}

enum CloudStorageServiceError: Error {
    case unexpectedEmptyMetadata
    case imageDidNotUpdate
    case failedToRemoveFile
}
