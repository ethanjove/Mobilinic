//
//  ContactSettingsNC.swift
//  PatientApp
//
//  Created by Apple on 3/1/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class ContactSettingsNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let contactSettingsVC = StoryboardManager.contactSettingsVC();
        self.addChildViewController(contactSettingsVC);
        //self.navigationItem.title = "Contacts"
        // Do any additional setup after loading the view.
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
