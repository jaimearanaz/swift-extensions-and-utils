//
//  FontExtension.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var avenirThinName: String { get { return "Avenir-Thin" } }
    
    static var avenirLightName: String { get { return "Avenir-Light" } }

    static var avenirRegularName: String { get { return "Avenir-Regular" } }

    static var avenirMediumName: String { get { return "Avenir-Medium" } }

    static var avenirBoldName: String { get { return "Avenir-Heavy" } }
    
    
    static var regularName: String { get { return "Avenir-Book" } }
    
    static var boldName: String { get { return "Avenir-Medium" } }
    
    static var lightName: String { get {  return "Avenit-Light" } }
    
    class func regular(size: Float) -> UIFont { return UIFont.init(name: UIFont.regularName, size: CGFloat(size))! }
    
    class func bold(size: Float) -> UIFont { return UIFont.init(name: UIFont.boldName, size: CGFloat(size))! }
    
    class func light(size: Float) -> UIFont { return UIFont.init(name: UIFont.lightName, size: CGFloat(size))! }
    
}
