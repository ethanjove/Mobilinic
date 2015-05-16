//
//  MainVC.swift
//  PatientApp
//
//  Created by Apple on 2/15/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove existing tabbar items
        self.viewControllers?.removeAll(keepCapacity: false);

        //customize the tabbar 
        self.setupTabBar()
        
        //setup tabbar items
        self.setupTabbarItems()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupTabBar () {
        self.tabBar.tintColor = UIColor(red: 0xf4/255, green: 0x43/255, blue: 0x36/255, alpha: 1);
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSFontAttributeName:UIFont.boldSystemFontOfSize(14)]
        appearance.setTitleTextAttributes(attributes, forState: .Normal)
        
    }
    
    func setupTabbarItems() {
        let dashboardNavigationController = StoryboardManager.dashboardNC();
        self.viewControllers?.append(dashboardNavigationController)
        let dashboardTabbarItem : UITabBarItem = self.tabBar.items![0] as! UITabBarItem;
        dashboardTabbarItem.image = UIImage(named: "tabbarDashboard");
        dashboardTabbarItem.title = NSLocalizedString("dashboard", value: "Dashboard", comment : "Dashboard")
        
        let healthdataViewController = StoryboardManager.healthDataVC();
        self.viewControllers?.append(healthdataViewController);
        let healthdataTabbarItem : UITabBarItem = self.tabBar.items![1] as! UITabBarItem;
        healthdataTabbarItem.image = UIImage(named: "tabbarHealthData");
        healthdataTabbarItem.title = NSLocalizedString("health_data", value: "Health Data", comment : "Health Data")
        
        let communityViewController = StoryboardManager.communityVC();
        self.viewControllers?.append(communityViewController);
        let communityTabbarItem : UITabBarItem = self.tabBar.items![2] as! UITabBarItem;
        communityTabbarItem.image = UIImage(named: "tabbarCommunity");
        communityTabbarItem.title = NSLocalizedString("community", value: "Community", comment : "Community")
        
        let settingsViewController = StoryboardManager.settingsVC();
        self.viewControllers?.append(settingsViewController);
        let settingsTabbarItem : UITabBarItem = self.tabBar.items![3] as! UITabBarItem;
        settingsTabbarItem.image = UIImage(named: "tabbarSettings");
        settingsTabbarItem.title = NSLocalizedString("settings", value: "Settings", comment : "Settings")
        
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
