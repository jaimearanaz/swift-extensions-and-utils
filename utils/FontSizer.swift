//
//  FontSizer.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

class FontSizer {
    
    static func scaleFontSizeToDevice(size: CGFloat) -> CGFloat {
        
        if (UIDevice.isiPhone3dot5Inches() || UIDevice.isiPhone4Inches()) {
            return size * 0.80
        } else if UIDevice.isiPhone5dot8Inches() {
            return size
        } else {
            return size * 0.90
        }
    }
}
