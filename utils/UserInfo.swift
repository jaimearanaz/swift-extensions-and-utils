//
//  UserInfo.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit
import CoreTelephony

class HttpHeadersInfo {
    
    static let wifi = "wifi"
    
    // MARK: - Public methods
    
    static func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    static func platformVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    static func carrierName() -> String {
        
        let networkInfo = CTTelephonyNetworkInfo()
        if let carrier = networkInfo.subscriberCellularProvider, let name = carrier.carrierName, name != "Carrier" {
            return name
        } else {
            return "unknown"
        }
    }
    
    static func deviceModel() -> String {
        return UIDevice.modelName
    }
    
    static func deviceLanguage() -> String {
        
        if let preferred = Locale.preferredLanguages.first {
            return preferred.lowercased()
        } else {
            return Locale.current.languageCode ?? "unkown"
        }
    }
    
    static func deviceIdentifier() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    static func appIdentifier() -> String {
        return "CustomerApp"
    }
    
    static func platformName() -> String {
        return "iOS"
    }
    
    static func signalIntensity() -> Int {
        // Signal level can't be retrieved in iOS
        return -1
    }
    
    static func connectionType() -> String {
        return Network().getNetworkType()
    }
}
