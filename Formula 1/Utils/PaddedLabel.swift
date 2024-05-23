//
//  PaddedLabel.swift
//  Formula 1
//
//  Created by Olya B on 23.05.2024.
//

import UIKit

class PaddedLabel: UILabel {
    var padding: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: padding)
        super.drawText(in: insetRect)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }
}
