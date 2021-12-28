//
//  String+Extensions.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
