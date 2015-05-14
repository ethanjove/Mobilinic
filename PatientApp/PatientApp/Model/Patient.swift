
import UIKit

class Patient : Person {
    
    var genderCode  : String
    var dateOfBirth : NSDate
    var bloodType   : String
    var heightCm    : Int
    var heightFt    : Int
    var heightInch  : Int
    var weightKg    : Double
    var weightLb    : Double
    
    var isOrganDonor: String
    
    override init() {
        
        self.genderCode  = ""
        self.bloodType   = ""
        self.heightCm    = 0
        self.heightFt    = 0
        self.heightInch  = 0
        self.weightKg    = 0
        self.weightLb    = 0
        
        self.isOrganDonor = ""
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        self.dateOfBirth = dateFormatter.dateFromString("1900-01-01")!
    }
    
    class var sharedInstance: Patient {
        struct Static {
            static var instance: Patient?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Patient()
        }
        
        return Static.instance!
    }
}

extension Patient {
    
    func gender() -> String {
        
        var gender = ""
        
        switch self.genderCode {
            case "M" : gender = "Male"
            case "F" : gender = "Female"
            default  : gender = ""
        }
        return gender
    }
    
    func dateOfBirthFormated() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle;
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle;
        
        var value = dateFormatter.stringFromDate(self.dateOfBirth)
        
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        var defaultDate : NSDate = dateFormatter.dateFromString("1900-01-01")!
        
        if (self.dateOfBirth == defaultDate) {
            value = ""
        }

        
        return value
    }
    
    func heightWithUnit() -> String {
        
        var value = ""
        if (Patient.sharedInstance.heightFt>0) {
            value   = String(Patient.sharedInstance.heightFt) + "'" + String(Patient.sharedInstance.heightInch) + "\""
        } else
        if (Patient.sharedInstance.heightCm>0) {
            value   = String(Patient.sharedInstance.heightCm) + " cm"
        }
        
        return value
    }
    
    func weightWithUnit() -> String {
        
        var weight = ""
        
        if (self.weightKg>0) {
            weight = String(format: "%.1f", self.weightKg) + " kg"
        } else
        if (self.weightLb>0) {
            weight = String(format: "%.1f", self.weightLb) + " Lb"
        }
        
        return weight
    }

    func organDonor() -> String {
        
        var donor = ""
        
        if (self.isOrganDonor=="Y") {
            donor = "Yes"
        } else
        if (self.isOrganDonor=="N") {
            donor = "No"
        }
        
        return donor
    }
}