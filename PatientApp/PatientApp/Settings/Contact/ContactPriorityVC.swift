//
//  ContactPriorityVC.swift
//  PatientApp
//
//  Created by Apple on 3/10/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

protocol PriorityTypeVCDelegate {
    func prioritySelected(controller:ContactPriorityVC, priorityID: Int, priority:String)
}
class ContactPriorityVC: UIViewController,UITableViewDelegate {
    
    var delegate:PriorityTypeVCDelegate? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var priorityItems = [Int:String]()
    
    var selectedItem : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPriorityItems()
        
        // Do any additional setup after loading the view.
    }
    
    func loadPriorityItems() {
        
        self.priorityItems = PriorityManager.instance.priorityList()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.priorityItems.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        //cell.textLabel?.text = self.priorityItems[indexPath.row+1]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let ID = indexPath.row + 1 
        let desc = priorityItems[ID]
        
        if (delegate != nil) {
            delegate!.prioritySelected(self, priorityID: ID, priority: desc!)
        }
        self.navigationController?.popViewControllerAnimated(true)
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
