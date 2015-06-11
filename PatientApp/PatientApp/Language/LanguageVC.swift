//
//  LanguageVC.swift
//  PatientApp
//
//  Created by Apple on 5/28/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit

protocol LanguageVCDelegate {
    func languageSelected(controller:LanguageVC, languageID: Int, languageCode:String)
}


class LanguageVC: UIViewController,UITableViewDelegate {

    var delegate:LanguageVCDelegate? = nil

    @IBOutlet weak var tableView: UITableView!
    
    //var languages = [Int:String]()
    var languages = [Language]()
    var selectedItem : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLanguages()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLanguages() {
        
        languages = LanguageManager.instance.newlanguageList()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return languages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        //cell.textLabel?.text = languages[indexPath.row]
        
        cell.textLabel?.text = languages[indexPath.row].languageInLocal;
        cell.detailTextLabel?.text = languages[indexPath.row].language;
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let lanID = indexPath.row;
        let lanCode = languages[lanID].code;
        
        if (delegate != nil) {
            delegate!.languageSelected(self, languageID: lanID, languageCode: lanCode)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }


    
}
