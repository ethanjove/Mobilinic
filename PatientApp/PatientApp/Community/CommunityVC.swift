//
//  CommunityVC.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class CommunityVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func EnglishButtonTouchedUp(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(["en"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
    }
    
    @IBAction func TurkishButtonTouchedUp(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(["tr"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
       
    }

    @IBAction func RussionButtonTouchedUp(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setObject(["ru"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
       
    }
    
    @IBAction func ArabicButtonTouchedUp(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(["ar"], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
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
