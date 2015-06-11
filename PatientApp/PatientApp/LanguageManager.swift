//
//  LanguageManager.swift
//  PatientApp
//
//  Created by Apple on 6/7/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import Foundation

let languageManager = LanguageManager ()

class LanguageManager {
    
    class var instance: LanguageManager {
        return languageManager
    }
    
    func newlanguageList() ->  [Language] {
        
        var list = [Language]();
        
        
        list.append(Language(code: "en", language: "English",languageInLocal: "English"))
        list.append(Language(code: "tr", language: "Turkish", languageInLocal: "Türkçe"))
        list.append(Language(code: "ar", language: "Arabic",languageInLocal: "العربية"))
        list.append(Language(code: "ru", language: "Russian", languageInLocal: "русский"))
                    
            
        
        return list
    }
    
    func languageList() -> [Int: String] {
        
        var list : [Int: String] = [
            0:"English",
            1:"Turkish",
            2:"Arabic",
            3:"Russian",
            4:"French",
            5:"Spanish",
            6:"Korean",
            7:"Japanese"
        ]
        
        return list
    }
}