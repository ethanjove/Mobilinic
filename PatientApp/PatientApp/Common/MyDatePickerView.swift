//
//  MyDatePicker.swift
//  PatientApp
//
//  Created by Apple on 2/18/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class MyDatePickerView: UIView {

    @IBOutlet var view: UIView!
    
    required init(coder aDecoder: NSCoder) {
        //properties
        super.init(coder: aDecoder)
        
        SetupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetupView()
    }
    
    func SetupView () {
        NSBundle.mainBundle().loadNibNamed("MyDatePickerView", owner: self, options: nil)
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight;
        self.addSubview(self.view)
    }

}
