//
//  UIDevice+Inches.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {

    static fileprivate var iPhone3dot5InchesHeight: CGFloat {
        get {
            return 480
        }
    }
    
    static fileprivate var iPhone4InchesHeight: CGFloat {
        get {
            return 568
        }
    }
    
    static fileprivate var iPhone4dot7InchesHeight: CGFloat {
        get {
            return 667
        }
    }
    
    static fileprivate var iPhone5dot5InchesHeight: CGFloat {
        get {
            return 736
        }
    }
    
    static fileprivate var isiPhone5dot8InchesHeight: CGFloat {
        get {
            return 812
        }
    }
    
    static fileprivate var isiPhone6dot1InchesType2Height: CGFloat {
        get {
            return 844
        }
    }
    
    static fileprivate var isiPhone6dot1InchesType1Height: CGFloat {
        get {
            return 896
        }
    }
    
    static fileprivate var isiPhone6dot5InchesHeight: CGFloat {
        get {
            return 896
        }
    }
    
    static fileprivate var isiPhone6dot7InchesHeight: CGFloat {
        get {
            return 926
        }
    }
    
    static fileprivate var retinaScale: CGFloat {
        get {
            return 2
        }
    }
    
    static fileprivate var superRetinaScale: CGFloat {
        get {
            return 3
        }
    }
    
    // MARK: - Public methods
    
    static func isiPhone3dot5Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone3dot5InchesHeight)
    }
    
    static func isiPhone4Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone4InchesHeight)
    }
    
    static func isiPhone4dot7Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone4dot7InchesHeight)
    }
    
    static func isiPhone5dot5Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == iPhone5dot5InchesHeight)
    }
    
    static func isiPhone5dot8Inches() -> Bool {
        
        return (UIScreen.main.bounds.size.height == isiPhone5dot8InchesHeight)
    }
    
    static func isiPhone6dot1Inches() -> Bool {
        
        let height = UIScreen.main.bounds.size.height
        let scale = UIScreen.main.nativeScale
        let is6dot1Type1 = ((height == isiPhone6dot1InchesType1Height) && (scale == retinaScale))
        let is6dot1Type2 = ((height == isiPhone6dot1InchesType2Height) && (scale == superRetinaScale))
        return ( is6dot1Type1 || is6dot1Type2 )
    }
    
    static func isiPhone6dot5Inches() -> Bool {
        
        let height = UIScreen.main.bounds.size.height
        let scale = UIScreen.main.nativeScale
        return ((height == isiPhone6dot5InchesHeight) && (scale == superRetinaScale))
    }
    
    static func isiPhone6dot7Inches() -> Bool {
        
        let height = UIScreen.main.bounds.size.height
        let scale = UIScreen.main.nativeScale
        return ((height == isiPhone6dot7InchesHeight) && (scale == superRetinaScale))
    }
}
