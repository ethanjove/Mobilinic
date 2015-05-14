//
//  MyPanelView.swift
//  PatientApp
//
//  Created by Apple on 3/13/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class MyPanelView: UIView {

    override func drawRect(rect: CGRect) {
        
        self.layer.borderColor = UIColor.grayColor().CGColor;
        self.layer.borderWidth = 0.1;
        
        self.layer.shadowColor = UIColor.blackColor().CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 0.2;
    }
}
