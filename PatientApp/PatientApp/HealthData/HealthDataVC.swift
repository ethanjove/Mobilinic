//
//  HealthDataVC.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class HealthDataVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DatePickerShow(sender: AnyObject) {
        var NewView = MyDatePickerView(frame : CGRectMake(50, 300, 300, 200))
        NewView.backgroundColor = UIColor.redColor();
        
        self.view.addSubview(NewView);
        
    }

    @IBAction func DatePickerHide(sender: AnyObject) {
        for view in self.view.subviews {
            if view.isKindOfClass(MyDatePickerView) {
                view.removeFromSuperview()
            }
        }
        
        PatientManager.instance.loadPatient()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
