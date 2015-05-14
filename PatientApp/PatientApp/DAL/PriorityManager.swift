//
//  PriorityManager.swift
//  PatientApp
//
//  Created by Apple on 3/10/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import Foundation

let priorityManager = PriorityManager ()

class PriorityManager {
    
    class var instance: PriorityManager {
        return priorityManager
    }
    
    func priorityList() -> [Int: String] {
        
        var list : [Int: String] = [
            1:"1",
            2:"2",
            3:"3",
        ]
        
        return list
    }
}
