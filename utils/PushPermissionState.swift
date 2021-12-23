//
//  PushPermissionState.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

protocol PushPermissionStateProtocol {
    
    func isPushPermissionGranted(_ completion: @escaping (_ isGranted: Bool) -> ())
    func wasPushPermissionDeniedPreviously(_ completion: @escaping (_ wasDenied: Bool) -> ())
}

class PushPermissionState: PushPermissionStateProtocol {
    
    func isPushPermissionGranted(_ completion: @escaping (_ isGranted: Bool) -> ()) {
        
        if #available(iOS 10.0, *) {
            
            let current = UNUserNotificationCenter.current()
            current.getNotificationSettings(completionHandler: { (settings) in
                switch settings.authorizationStatus {
                case .notDetermined, .denied:
                    completion(false)
                case .authorized, .provisional, .ephemeral:
                    completion(true)
                @unknown default:
                    completion(false)
                }
            })
            
        } else {
            
            if UIApplication.shared.isRegisteredForRemoteNotifications {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func wasPushPermissionDeniedPreviously(_ completion: @escaping (_ wasDenied: Bool) -> ()) {
        
        if #available(iOS 10.0, *) {
            
            let current = UNUserNotificationCenter.current()
            current.getNotificationSettings(completionHandler: { (settings) in
                switch settings.authorizationStatus {
                case .denied:
                    completion(true)
                case .notDetermined, .authorized, .provisional, .ephemeral:
                    completion(false)
                @unknown default:
                    completion(false)
                }
            })
            
        } else {
            
            if UIApplication.shared.isRegisteredForRemoteNotifications {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
