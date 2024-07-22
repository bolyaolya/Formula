//
//  FileManagerService.swift
//  Formula 1
//
//  Created by Olya Boyko on 22.07.2024.
//

import Foundation

//MARK: - FileManagerServiceProtocol

protocol FileManagerServiceProtocol {
    func addImageData(_ imageData: Data, _ id: String) throws
    func getImageData() throws -> [String:Data]
    func removeAll() throws
}

//MARK: - FileManagerService

final class FileManagerService {
    
    private let fileManager = FileManager.default
    
    private func createDocumentsURL() throws -> URL {
        let documentsURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        let imagesURL = documentsURL.appendingPathComponent("drivers")
        try fileManager.createDirectory(at: imagesURL, withIntermediateDirectories: true)
        return imagesURL
    }
    
    private func contents() throws -> [URL] {
        let url = try createDocumentsURL()
        return try fileManager.contentsOfDirectory(at: url,
                                                   includingPropertiesForKeys: nil,
                                                   options: [.skipsHiddenFiles])
    }
}

//MARK: - extension FileManagerServiceProtocol

extension FileManagerService: FileManagerServiceProtocol {
    
    func addImageData(_ imageData: Data, _ id: String) throws {
        let url = try createDocumentsURL()
        let nameFileURL = url.appendingPathComponent(id)
        fileManager.createFile(atPath: nameFileURL.path, contents: imageData)
    }
    
    func getImageData() throws -> [String:Data] {
        
        var idAndImageData: [String:Data] = [:]
        let urlArray = try contents()
        
        for imageUrl in urlArray {
            let imageData = try Data(contentsOf: imageUrl)
            idAndImageData.updateValue(imageData, forKey: imageUrl.lastPathComponent)
        }
        
        return idAndImageData
    }
    
    func removeAll() throws {
        let urlArray = try contents()
        
        for imageUrl in urlArray {
            try fileManager.removeItem(at: imageUrl)
        }
    }
}
