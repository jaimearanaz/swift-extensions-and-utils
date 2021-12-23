//
//  NSPrettyLog.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

enum PrettyLogType: Int {
    
    case networkRequest
    case networkResponse
    case networkCacheResponse
    case networkError
    case analytics
    case imageRequest
    case imageFinished
    case imageError
    case notification
    case notificationError
    case genericError
    case none
}

class PrettyLog {
    
    // MARK: - Public methods
    
    static func logMessage(_ message: String, type: PrettyLogType) {
        
        #if DEBUG
            
            let symbol = (type == .none) ? "" : prettySymbolForType(type)
            
            // Don't use \(variable) notation, or it will crash
            // http://stackoverflow.com/questions/9613365/exc-bad-access-on-nslog-with-no-string-formatting
            NSLog("%@ %@", symbol, message)
            
        #endif
    }
    
    // MARK: - Private methods
    
    static fileprivate func prettySymbolForType(_ type: PrettyLogType) -> String {
        
        switch type {
        case .networkRequest:
            return "🌏⬆️"
        case .networkResponse:
            return "🌏⬇️"
        case .networkCacheResponse:
            return "🌏💾"
        case .networkError:
            return "🌏❗️"
        case .analytics:
            return "📈"
        case .imageRequest:
            return "🏞⬆️"
        case .imageFinished:
            return "🏞🏁"
        case .imageError:
            return "🏞❗️"
        case .notification:
            return "📢"
        case .notificationError:
            return "📢❗️"
        case .genericError:
            return "❗️"
        case .none:
            return ""
        }
    }
}

