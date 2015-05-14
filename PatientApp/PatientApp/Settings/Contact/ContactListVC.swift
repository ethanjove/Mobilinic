//
//  ContactSettingsVC.swift
//  PatientApp
//
//  Created by Apple on 3/4/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class ContactListVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    var contactList : Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadContacts()
        tableView.reloadData()
    }
    
    func loadContacts() {
        
        contactList = ContactManager.instance.loadContacts()
        //tableView.reloadData()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "updateContact" {
            
            var selectedContact = contactList[self.tableView.indexPathForSelectedRow()!.row] as! Contact
            
            let contactDetailsVC: ContactDetailsVC = segue.destinationViewController as! ContactDetailsVC
            
            contactDetailsVC.existingContact = selectedContact
            
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return contactList.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
        
       
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ContactListCell
        let contact: Contact = contactList[indexPath.row] as! Contact
        
        cell.contactNameLabel.text = contact.fullname()
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
