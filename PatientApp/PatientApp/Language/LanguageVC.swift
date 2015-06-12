//
//  LanguageVC.swift
//  PatientApp
//
//  Created by Apple on 5/28/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit


class LanguageVC: UIViewController,UITableViewDelegate {


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
        
        NSUserDefaults.standardUserDefaults().setObject([lanCode], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var languageAlert = UIAlertController(title: "Language", message: "To apply the language changes, terminate the application and restart it again.", preferredStyle: UIAlertControllerStyle.Alert)
        
        languageAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
            
        }))
        

        
        presentViewController(languageAlert, animated: true, completion: nil)
        
        self.navigationController?.popViewControllerAnimated(true)
    }


    
}
