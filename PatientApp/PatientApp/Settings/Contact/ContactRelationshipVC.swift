//
//  ContactRelationshipVC.swift
//  PatientApp
//
//  Created by Apple on 3/5/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

protocol ContactRelationshipVCDelegate {
    func relationshipSelected(controller:ContactRelationshipVC, relationshipID: Int, relationship:String)
}

class ContactRelationshipVC: UIViewController,UITableViewDelegate {
    
    var delegate:ContactRelationshipVCDelegate? = nil

    @IBOutlet weak var tableView: UITableView!
    
    var relationships = [Int:String]()
    
    var selectedItem : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRelationships()
        
        // Do any additional setup after loading the view.
    }

    func loadRelationships() {
        
        relationships = RelationshipManager.instance.relationshipList()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return relationships.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = relationships[indexPath.row]
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let relID = indexPath.row
        let relship = relationships[relID]
        
        if (delegate != nil) {
            delegate!.relationshipSelected(self, relationshipID: relID, relationship: relship!)
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
