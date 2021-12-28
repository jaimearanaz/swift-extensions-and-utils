//
//  Date+Extension.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

extension Date {
    
    func toSeconds() -> Int64! {
        return Int64(self.timeIntervalSince1970)
    }
    
    func toStringIso8601() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
    func toStringIso8601WithNoTime() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00'Z'"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
    
    func toDateWithNoTime() -> Date {
        
        let dateString: String = toStringIso8601WithNoTime()
        return Date.getDate(fromIso8601: dateString) ?? Date()
    }
    
    static func getDate(fromIso8601 string: String?) -> Date? {
        
        guard let string = string else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: string)
        
        return date
    }
    
    func getReadableShortDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM d")
        return dateFormatter.string(from: self)
    }
    
    func getReadableDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM dd")
        return dateFormatter.string(from: self)
    }
}
