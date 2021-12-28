//
//  FontExtension.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import UIKit

extension UIFont {
    
    // Add fonts in Info.plist at UIAppFonts property
    
    static func regular(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size)!
    }
    
    static func bold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size)!
    }

    static func black(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Black", size: size)!
    }
}
