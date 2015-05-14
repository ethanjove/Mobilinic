//
//  MedicalIDVC.swift
//  PatientApp
//
//  Created by Apple on 2/16/15.
//  Copyright (c) 2015 Mobilinic. All rights reserved.
//

import UIKit


class PatientSettingsVC: UITableViewController, UIPickerViewDelegate,UITextFieldDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hideDataEntryObjects()
        setupWeightArray();
        setupHeightArray();
        
        setPatientInformation();
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func hideDataEntryObjects() {
        self.view.endEditing(true)
        self.firstNameTextField.hidden = true
        self.lastNameTextField.hidden = true
        self.nameSaveButton.hidden = true
        
        self.genderSegment.hidden = true;
        self.dobDatePicker.hidden = true;
        self.dobSaveButton.hidden = true;
        self.bloodTypeSelectionView.hidden = true;
        self.heightPicker.hidden = true;
        self.heightUnitSelector.hidden = true;
        self.heightSaveButton.hidden = true;
        self.weightPicker.hidden = true;
        self.weightSaveButton.hidden = true;
        self.donorSegment.hidden = true;
    }
    
    var fullNameCellIndex = -1;
    var dobCellIndex = -1;
    var bloodTypeCellIndex = -1;
    var heightCellIndex = -1;
    var weightCellIndex = -1;
    
    func resetCellHeights() {
        hideDataEntryObjects()
        
        self.fullNameCellIndex = -1;
        self.dobCellIndex = -1;
        self.bloodTypeCellIndex = -1;
        self.heightCellIndex = -1;
        self.weightCellIndex = -1;
        
        
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var cellHeight:CGFloat = 55;
        
        switch indexPath.row {
        case 0                          : if (self.fullNameCellIndex == 0) {cellHeight = 150} else {cellHeight = 80}
        case self.dobCellIndex          : cellHeight = 200
        case self.bloodTypeCellIndex    : cellHeight = 120
        case self.heightCellIndex       : cellHeight = 190
        case self.weightCellIndex       : cellHeight = 190
        default                         : cellHeight = 55;
        }
        
        return cellHeight;
    }
   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor.whiteColor()
        //cell?.backgroundColor = UIColor.whiteColor()
        
        if (indexPath.row == 0) {
            showFullNameCell()
        } else
        if (indexPath.row == 1) {
            showGenderCell()
        } else
        if (indexPath.row == 2) {
            showDateOfBirthCell()
        } else
        if (indexPath.row == 3) {
            showBloodTypeCell()
        } else
        if (indexPath.row == 4) {
            showHeightCell()
        } else
        if (indexPath.row == 5) {
            showWeightCell()
        } else
        if (indexPath.row == 6) {
            showDonorCell()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // ========= Load Patient Information ===========
    
    func setPatientInformation() {
        
        self.fullNameValueLabel.text   = Patient.sharedInstance.fullname()
        
        if (self.fullNameValueLabel.text == " ") {
            self.fullNameValueLabel.text = "Your Full Name"
        }
        
        self.firstNameTextField.text    = Patient.sharedInstance.firstname
        self.lastNameTextField.text     = Patient.sharedInstance.lastname
        self.genderValueLabel.text       = Patient.sharedInstance.gender()
        self.dobValueLabel.text          = Patient.sharedInstance.dateOfBirthFormated()
        self.bloodTypeValueLabel.text    = Patient.sharedInstance.bloodType
        self.heightValueLabel.text       = Patient.sharedInstance.heightWithUnit()
        self.weightValueLabel.text       = Patient.sharedInstance.weightWithUnit()
        self.donorValueLabel.text        = Patient.sharedInstance.organDonor()
    }
    
    
    
    // =========  Field Specific Code  =====================
    
    
    //------------------ Full Name ------------------------
    
    @IBOutlet weak var fullNameCell: UITableViewCell!
    @IBOutlet weak var fullNameValueLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameSaveButton: UIButton!
    
    
    
    @IBAction func saveNameButtonPressed(sender: AnyObject) {
        Patient.sharedInstance.firstname = firstNameTextField.text.capitalizedString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        Patient.sharedInstance.lastname  = lastNameTextField.text.capitalizedString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        PatientManager.instance.savePatient()
        
        self.fullNameValueLabel.text = Patient.sharedInstance.fullname()
        
        resetCellHeights();
    }
    
    func showFullNameCell() {
        resetCellHeights();
        self.firstNameTextField.hidden = false
        self.lastNameTextField.hidden = false
        self.nameSaveButton.hidden = false
        
        self.fullNameCellIndex = 0;
        
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
    }
    
    //------------------- Gender ---------------------------
    
    @IBOutlet weak var genderValueLabel: UILabel!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    func showGenderCell() {
        resetCellHeights();
        
        if (Patient.sharedInstance.genderCode == "M") {
            genderSegment.selectedSegmentIndex = 0
        } else
        if (Patient.sharedInstance.genderCode == "F") {
            genderSegment.selectedSegmentIndex = 1
        }
        
        self.genderSegment.hidden = false;
        self.genderValueLabel.hidden = true;
    }
    
    @IBAction func genderSegmentValueChanged(sender: AnyObject) {
        let selectedIndex = genderSegment.selectedSegmentIndex;
        
        if(selectedIndex == 0)
        {
            Patient.sharedInstance.genderCode = "M"
        } else
        if(selectedIndex == 1)
        {
            Patient.sharedInstance.genderCode = "F"
        };
    
        PatientManager.instance.savePatient();
        
        self.genderValueLabel.text = Patient.sharedInstance.gender();
        
        self.genderValueLabel.hidden = false;
        self.genderSegment.hidden = true;
    }
    
    
    
    //------------------- Date of Birth -----------------------
    
    @IBOutlet weak var dobValueLabel: UILabel!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    @IBOutlet weak var dobSaveButton: UIButton!
    
    func showDateOfBirthCell() {
        resetCellHeights();
        if (self.dobCellIndex == -1) {
            self.dobCellIndex = 2
        } else {
            self.dobCellIndex = -1
        }
        
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
        
        if (self.dobCellIndex == -1) {
            self.dobDatePicker.hidden = true;
            self.dobSaveButton.hidden = true;
        } else {
            self.dobDatePicker.hidden = false;
            self.dobSaveButton.hidden = false;
        }
        
        if (Patient.sharedInstance.dateOfBirthFormated()>"") {
            dobDatePicker.date = Patient.sharedInstance.dateOfBirth
        } else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            var defaultDate : NSDate = dateFormatter.dateFromString("1960-01-01")!
            dobDatePicker.date = defaultDate
        }
        
    }
    
    @IBAction func dobValueChanged(sender: AnyObject) {
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle;
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle;
        dateFormatter.locale    = NSLocale.currentLocale();
        
        self.dobValueLabel.text = dateFormatter.stringFromDate(dobDatePicker.date);
    }
    
    @IBAction func dobSaveButtonPressed(sender: AnyObject) {
        
        Patient.sharedInstance.dateOfBirth = dobDatePicker.date
        PatientManager.instance.savePatient();
        resetCellHeights();
    }
    
    
    //------------------- Blood Type ----------------------------------------
    
    @IBOutlet weak var bloodTypeValueLabel: UILabel!
    @IBOutlet weak var bloodTypeSelectionView: UIView!
    @IBOutlet weak var bloodTypeSegment: UISegmentedControl!
    @IBOutlet weak var bloodTypeRhSegment: UISegmentedControl!
    @IBOutlet weak var bloodTypeSaveButton: UIButton!

    func showBloodTypeCell() {
        resetCellHeights();
    
        let bloodType = Patient.sharedInstance.bloodType
        var groupIndex = 0
        var rhIndex = 0
        switch bloodType {
        case "A +" : groupIndex = 0; rhIndex = 0
        case "A -" : groupIndex = 0; rhIndex = 1
        case "B +"  : groupIndex = 1; rhIndex = 0
        case "B -"  : groupIndex = 1; rhIndex = 1
        case "AB +" : groupIndex = 2; rhIndex = 0
        case "AB -" : groupIndex = 2; rhIndex = 1
        case "0 +"  : groupIndex = 3; rhIndex = 0
        case "0 -"  : groupIndex = 3; rhIndex = 1
        default   : groupIndex = 0; rhIndex = 0
        }
        
        bloodTypeSegment.selectedSegmentIndex = groupIndex
        bloodTypeRhSegment.selectedSegmentIndex = rhIndex
        
        
        self.bloodTypeSelectionView.hidden = false;
        
        self.bloodTypeCellIndex = 3;
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
        
    }
    
    @IBAction func bloodTypeSegmentValueChanged(sender: AnyObject) {
        setBloodTypeValue()
    }
    
    @IBAction func bloodTypeRhSegmentValueChanged(sender: AnyObject) {
        setBloodTypeValue()
    }
    
    func setBloodTypeValue() {
        var bloodType = "";
        
        switch bloodTypeSegment.selectedSegmentIndex {
        case 0:bloodType = "A"
        case 1:bloodType = "B"
        case 2:bloodType = "AB"
        case 3:bloodType = "0"
        default :bloodType = ""
        }
        
        var rh = "";
        
        switch bloodTypeRhSegment.selectedSegmentIndex {
        case 0:rh = "+"
        case 1:rh = "-"
        default :rh = ""
        }
        
        bloodType = bloodType + " " + rh;
        
        
        bloodTypeValueLabel.text = bloodType;
        Patient.sharedInstance.bloodType = bloodType;
        PatientManager.instance.savePatient();
        
    }
    
    @IBAction func bloodTypeSaveButtonPressed(sender: AnyObject) {
        setBloodTypeValue()
        
        resetCellHeights();
        
    }
    
    
    //=================  PickerView Settings  ======================
    
    //--- Returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        var numberOfComponents = 0;
        
        // heightPicker
        if (pickerView.tag) == 10 {
            if (self.heightUnitSelector.selectedSegmentIndex == 0) {
                // cm
                numberOfComponents = 1
            } else {
                // inch
                numberOfComponents = 2
            }
        }
        
        // weightPicker
        if (pickerView.tag) == 20 {
            numberOfComponents = 3
        }
        
        return numberOfComponents
    }
    
    //--- Returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var numberOfRows = 0;
        
        // heightPicker
        if (pickerView.tag == 10) {
            
            if (self.heightUnitSelector.selectedSegmentIndex == 0) {
                numberOfRows = self.heightMetricUnitValues.count
            } else  {
                if (component == 0) {
                    numberOfRows = self.heightImperialUnitValues.count
                }
                
                if (component == 1) {
                    numberOfRows = self.heightImperialUnitDecimalValues.count
                }
            }
            
        }
        
        // weightPicker
        if (pickerView.tag == 20) {
            
            if (component == 0) {
                numberOfRows = 300
            }
            
            if (component == 1) {
                numberOfRows = 10
            }
            
            if (component == 2) {
                numberOfRows = 2
            }
        }
        return numberOfRows
    }
    
    
    //---- Set values  -----------
    
    let heightCmMin = 50
    let heightCmMax = 220
    let heightFtMin = 2
    let heightFtMax = 7
    
    var heightMetricUnitValues = [Int]();
    var heightImperialUnitValues = [Int]();
    var heightImperialUnitDecimalValues = [Int]();
    
    func setupHeightArray(){
        
        for value in heightCmMin...heightCmMax {
            heightMetricUnitValues.append(value);
        };
        
        for value in heightFtMin...heightFtMax {
            heightImperialUnitValues.append(value);
        };
        
        for value in 0...11 {
            heightImperialUnitDecimalValues.append(value);
        };
    }
    
    let weightMin = 30
    let weightMax = 300
    
    
    var weightValues = [Int]();
    var weightDecimalValues = [Int]();
    var weightUnitValues = ["kg","lb"]
    
    func setupWeightArray(){
        
        for value in weightMin...weightMax {
            weightValues.append(value);
        };
        
        for value in 0...10 {
            weightDecimalValues.append(value);
        };
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        var value = "";
        
        //  heightPicker
        if (pickerView.tag == 10) {
            
            if (self.heightUnitSelector.selectedSegmentIndex == 0) {
                value = String (heightMetricUnitValues[row])
            } else {
                
                if (component == 0) {
                    value = String(heightImperialUnitValues[row]) + "'";
                }
                
                if (component == 1) {
                    
                    value = String(heightImperialUnitDecimalValues[row]) + "\"";
                }
            }
        }
        
        //  weightPicker
        if (pickerView.tag == 20) {
            
            if (component == 0) {
                value = String (weightValues[row])
            }
            
            if (component == 1) {
                
                value = "." + String(weightDecimalValues[row]);
            }
            
            if (component == 2) {
                value = self.weightUnitValues[row]
            }
        }
        return value;
    }

    
    //---- Get the selected value --
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //heightPicker
        if (pickerView.tag == 10) {
            setHeightValue(row, component: component);
        }
        
        //weightPicker
        if (pickerView.tag == 20) {
            setWeightValue(row, component: component);
        }
    }
    
    //=================  PickerView Settings END  ======================
    
    
    //------------------- Height ---------------------------------
    
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var heightPicker: UIPickerView!
    @IBOutlet weak var heightUnitSelector: UISegmentedControl!
    @IBOutlet weak var heightSaveButton: UIButton!
    
    func showHeightCell() {
        
        resetCellHeights();
        
        self.heightPicker.hidden = false;
        self.heightUnitSelector.hidden = false;
        self.heightSaveButton.hidden = false;
        
        if (Patient.sharedInstance.heightFt > 0) {
            self.heightUnitSelector.selectedSegmentIndex = 1
            
        } else {
            self.heightUnitSelector.selectedSegmentIndex = 0
        }
        self.heightCellIndex = 4;
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
        self.heightPicker.reloadAllComponents();
        var heightRow = 0;
        
        if (Patient.sharedInstance.heightFt > 0) {
            self.height = Patient.sharedInstance.heightFt
            self.heightDecimal = Patient.sharedInstance.heightInch
            
            heightRow = Patient.sharedInstance.heightFt - self.heightFtMin
            heightPicker.selectRow(Patient.sharedInstance.heightInch, inComponent: 1, animated: true)
            
        } else {
            self.height = Patient.sharedInstance.heightCm
            heightRow = Patient.sharedInstance.heightCm - self.heightCmMin
        }
        
        if heightRow<0 {
            heightRow = 160 - self.heightCmMin
        }
        
        heightPicker.selectRow(heightRow, inComponent: 0, animated: true)
    }
    
    @IBAction func heightUnitChanged(sender: AnyObject) {
        self.heightPicker.reloadAllComponents();
    }
    @IBAction func heightSaveButtonPressed(sender: AnyObject) {
        resetCellHeights();
    }
    
    
    var height  = 0
    var heightDecimal  = 0
    
    func setHeightValue(row:Int, component:Int) {
        
        var value = "";
        
        if (heightUnitSelector.selectedSegmentIndex==0) {
            if (component == 0) {
                height = self.heightMetricUnitValues[row];
                
                Patient.sharedInstance.heightCm = height
                Patient.sharedInstance.heightFt = 0
                Patient.sharedInstance.heightInch = 0
                
                value = String(height) + " cm"
            }
        } else {
            Patient.sharedInstance.heightCm = 0
            
            if (component == 0) {
                height = self.heightImperialUnitValues[row];
                Patient.sharedInstance.heightFt = height
            }
            value = String(height) + "\' "
            if (component == 1) {
                heightDecimal = self.heightImperialUnitDecimalValues[row];
                Patient.sharedInstance.heightInch = heightDecimal
            }
            value = value + String(heightDecimal) + "\""
        }
        
        self.heightValueLabel.text = value;
        
        PatientManager.instance.savePatient()
    }

    
    //------------------- Weight ---------------------------
    
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var weightPicker: UIPickerView!
    @IBOutlet weak var weightSaveButton: UIButton!
    
    func showWeightCell() {
        
        resetCellHeights();
        
        self.weightPicker.hidden = false;
        self.weightSaveButton.hidden = false;
        
        self.weightCellIndex = 5;
        let indexPath = NSIndexPath(forRow: -1, inSection: 0)
        
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic);
        
        var unit = 0
        var dec : Float = 0
        if (Patient.sharedInstance.weightKg>0) {
            self.weight = Int(floor(Float(Patient.sharedInstance.weightKg)))
            dec = Float(Patient.sharedInstance.weightKg) - floor(Float(Patient.sharedInstance.weightKg))
        } else
        if (Patient.sharedInstance.weightLb>0) {
            self.weight = Int(floor(Float(Patient.sharedInstance.weightLb)))
            dec = Float(Patient.sharedInstance.weightLb) - floor(Float(Patient.sharedInstance.weightLb))
            unit = 1
        }
        self.weightDecimal = Int(round(dec * 10))
        
        self.weightPicker.selectRow(self.weight - weightMin, inComponent: 0, animated: true)
        self.weightPicker.selectRow(self.weightDecimal, inComponent: 1, animated: true)
        self.weightPicker.selectRow(unit, inComponent: 2, animated: true)
        
        
    }
    @IBAction func weightSaveButtonPressed(sender: AnyObject) {
        resetCellHeights();
    }
    
    var weight = 70
    var weightDecimal = 0
    var weightUnitStr = "kg"
    
    func setWeightValue(row:Int, component:Int) {
        
        if (component == 0) {
            weight = self.weightValues[row];
        }
        if (component == 1) {
            weightDecimal = self.weightDecimalValues[row];
        }
        if (component == 2) {
            if (row == 0) {
                weightUnitStr = "kg"
            } else {
                weightUnitStr = "lb"
            };
        }
        var value = String(weight);
        
        if (weightDecimal>0) {
            value = value + "." + String(weightDecimal)
        }
        if weightUnitStr == "kg" {
            Patient.sharedInstance.weightKg = Double(weight) + Double(weightDecimal)/10
            Patient.sharedInstance.weightLb = 0
        } else {
            Patient.sharedInstance.weightLb = Double(weight) + Double(weightDecimal)/10
            Patient.sharedInstance.weightKg = 0
        }
        PatientManager.instance.savePatient()
        
        value = value + " " + weightUnitStr;
        self.weightValueLabel.text = value;
        
    }
    
    
    //------------------- Donor ---------------------------
    
    @IBOutlet weak var donorValueLabel: UILabel!
    @IBOutlet weak var donorSegment: UISegmentedControl!
    
    func showDonorCell() {
        resetCellHeights();
        self.donorSegment.hidden = false;
        self.donorValueLabel.hidden = true;
        
        var id = 2;
        
        switch Patient.sharedInstance.isOrganDonor {
        case "Y" : id = 0
        case "N" : id = 1
        default  : id = 2
        }
        
        donorSegment.selectedSegmentIndex = id
    }
    
    @IBAction func donorSegmentSelected(sender: AnyObject) {
        
        var value = "";
        
        if (donorSegment.selectedSegmentIndex == 0) {
            value = "Y"
        } else
        if (donorSegment.selectedSegmentIndex == 1) {
            value = "N"
        };
        
        Patient.sharedInstance.isOrganDonor = value
        PatientManager.instance.savePatient()
        
        self.donorValueLabel.text = Patient.sharedInstance.organDonor();
        self.donorValueLabel.hidden = false;
        self.donorSegment.hidden = true;
        
    }
    
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }*/

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
