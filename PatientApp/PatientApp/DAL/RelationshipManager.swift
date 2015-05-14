//
//  RelationshipManager.swift
//  PatientApp
//
//  Created by Apple on 3/6/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import Foundation

let relationshipManager = RelationshipManager ()

class RelationshipManager {
    
    class var instance: RelationshipManager {
        return relationshipManager
    }
 
    func relationshipList() -> [Int: String] {
      
        var list : [Int: String] = [
            1:"mother",
            2:"father",
            3:"parent",
            4:"brother",
            5:"sister",
            6:"child",
            7:"friend",
            8:"spouse",
            9:"partner",
           10:"asistant",
           11:"manager",
           12:"neigbour",
           13:"doctor",
           14:"emergency",
           15:"other"
        ]
        
        return list
    }
}
