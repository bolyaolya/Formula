//
//  UIImage+Extension.swift
//  Formula 1
//
//  Created by Olya Boyko on 18.07.2024.
//

import UIKit

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
