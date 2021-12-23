//
//  Reachability.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import SystemConfiguration
import CoreTelephony

protocol NetworkProtocol {
    
    static func isInternetAvailable() -> Bool
}

class Network: NetworkProtocol {
    
    // MARK: - Public methods
    
    static func isInternetAvailable() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection)
    }
    
    func getNetworkType() -> String {
        
        do {
            let reachability : Reachability = Reachability.forInternetConnection()
            
            do {
                
                reachability.startNotifier()
                let status = reachability.currentReachabilityStatus()
                
                if (status == NotReachable) {
                    return ""
                    
                } else if (status == ReachableViaWiFi) {
                    return HttpHeadersInfo.wifi
                    
                } else if (status == ReachableViaWWAN) {
                    
                    let networkInfo = CTTelephonyNetworkInfo()
                    let carrierType = networkInfo.currentRadioAccessTechnology
                    
                    switch carrierType{
                    case CTRadioAccessTechnologyGPRS?,
                         CTRadioAccessTechnologyEdge?,
                         CTRadioAccessTechnologyCDMA1x?:
                        return "2G"
                        
                    case CTRadioAccessTechnologyWCDMA?,
                         CTRadioAccessTechnologyHSDPA?,
                         CTRadioAccessTechnologyHSUPA?,
                         CTRadioAccessTechnologyCDMAEVDORev0?,
                         CTRadioAccessTechnologyCDMAEVDORevA?,
                         CTRadioAccessTechnologyCDMAEVDORevB?,
                         CTRadioAccessTechnologyeHRPD?:
                        return "3G"
                        
                    case CTRadioAccessTechnologyLTE?:
                        return "4G"
                        
                    default:
                        return ""
                    }

                } else {
                    return ""
                }
            }
        }
    }
}
