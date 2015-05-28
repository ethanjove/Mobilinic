//
//  SettingsVC.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class HealthDataVC: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupSubStoryboards();
        //self.preferredDisplayMode = .AllVisible;
        
              
        

        // Do any additional setup after loading the view.
    }
    //let dashboardViewController = StoryboardManager.dashboardVC();
    //self.viewControllers?.append(dashboardViewController)
    
    func setupSubStoryboards() {
        //self.viewControllers.removeAll(keepCapacity: false);
        
        //let patientSettingsViewController = StoryboardManager.patientSettingsVC();
        //self.viewControllers.append(patientSettingsViewController)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
