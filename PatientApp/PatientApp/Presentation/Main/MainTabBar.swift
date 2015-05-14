//
//  MainTabBar.swift
//  PatientApp
//
//  Created by Apple on 3/3/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    override func sizeThatFits(size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 65
        
        return sizeThatFits
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
