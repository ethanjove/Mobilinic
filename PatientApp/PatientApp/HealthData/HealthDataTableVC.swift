//
//  SettingsTableVCTableViewController.swift
//  PatientApp
//
//  Created by Apple on 2/22/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class HealthDataTableVC: UITableViewController, UISplitViewControllerDelegate {
    
    private var collapseDetailViewController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 60
        
        splitViewController?.delegate = self;
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - UISplitViewControllerDelegate
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        
        for subview in cell.contentView.subviews {
            if subview is UILabel {
                let text = subview as! UILabel
                text.textAlignment = NSTextAlignment.Natural
                break
            }
        }
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //self.collapseDetailViewController = false
        
        //var cell = tableView.cellForRowAtIndexPath(indexPath)
        
        
        
        //cell?.contentView.backgroundColor = UIColor(red: 0x21/255, green: 0x96/255, blue: 0xF3/255, alpha: 1);
        //cell?.contentView.
        //cell?.backgroundColor = UIColor.whiteColor()
        
        //if (indexPath.row == 0) {
        //    let patientSettingsVC = StoryboardManager.patientSettingsVC();
            
            
        //    self.presentViewController(patientSettingsVC, animated: true, completion: nil);
            
            //self.splitViewController?.viewControllers.append(patientSettingsVC);
                
            //presentViewController(patientSettingsVC, animated: true, completion: nil);
            
        //    self.navigationController!.presentViewController(patientSettingsVC, animated: true, completion: nil)
            //self.presentViewController(patientSettingsVC, animated:true, completion: nil);
        //}
    }

    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        return collapseDetailViewController
    }
   
    // MARK: - Table view data source

    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
    */
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }

    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
