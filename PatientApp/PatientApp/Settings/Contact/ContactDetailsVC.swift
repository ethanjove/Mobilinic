//
//  ContactDetailsVC.swift
//  PatientApp
//
//  Created by Apple on 3/4/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

class ContactDetailsVC: UIViewController,
        ContactRelationshipVCDelegate,
        PriorityTypeVCDelegate
    {

    
    var existingContact = Contact();
    var selectedRelationshipID : Int = 0
    var selectedPriorityID : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadExistingContact()
        
        // Do any additional setup after loading the view.
    }

    func loadExistingContact() {
        if self.existingContact.contactID > 0 {
            self.firstNameTextField.text = existingContact.firstname
            self.lastNameTextField.text  = existingContact.lastname
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cellPhoneTextField: UITextField!
    @IBOutlet weak var homePhoneTextField: UITextField!
    @IBOutlet weak var workPhoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        var contact = Contact()
        
        contact.contactID   = existingContact.contactID; // if new contact the contactID will be zero
        contact.firstname   = self.firstNameTextField.text
        contact.lastname    = self.lastNameTextField.text
        contact.relationTypeID = self.selectedRelationshipID
        
        ContactManager.instance.saveContact(contact)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showRelationshipTypes"{
            let vc = segue.destinationViewController as! ContactRelationshipVC
            
            vc.delegate = self
        } else
        if segue.identifier == "showPriorityTypes"{
            let vc = segue.destinationViewController as! ContactPriorityVC
                
            vc.delegate = self
        }
    }
    
    @IBOutlet weak var relationshipTextField: UITextField!
    @IBAction func relationshipTextFieldPressed(sender: UITextField) {
        self.performSegueWithIdentifier("showRelationshipTypes", sender: nil)
    }
    
    func relationshipSelected(controller: ContactRelationshipVC, relationshipID : Int, relationship: String) {
        
        selectedRelationshipID = relationshipID
        self.relationshipTextField.text = relationship.capitalizedString
    }
    
    @IBOutlet weak var priorityTextField: UITextField!
    @IBAction func priorityTextFieldPressed(sender: UITextField) {
        self.performSegueWithIdentifier("showPriorityTypes", sender: nil)
    }
    
    func prioritySelected(controller: ContactPriorityVC, priorityID : Int, priority: String) {
        
        selectedPriorityID = priorityID
        self.priorityTextField.text = priority.capitalizedString
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
