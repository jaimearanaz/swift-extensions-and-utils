//
//  ClosureForAsyncTesting.swift
//
//  Created by Jaime Aranaz on 23/12/2021.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

/*
 Some methods have asynchronous operations inside, but the don't have a closure as input parameter
 to be executed when the asynch operation is finished.
 
 For that, is not possible to test its behaviour. We don't know when the asynch operation is done.
 
 Adding this completion closure to them as input parameter let us to use expectations and wait()
 during unit testing.
 */
typealias CompletionForAsyncTesting = () -> ()
