//
//  UILabel+Extension.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func retrieveTextHeight() -> CGFloat {
        
        var height = self.frame.height
        if let font = self.font {
            let attributedText = NSAttributedString(string: self.text!, attributes: [NSAttributedString.Key.font: font])
            let size = CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
            let rect = attributedText.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
            height = rect.size.height
        }
        return ceil(height)
    }
}
