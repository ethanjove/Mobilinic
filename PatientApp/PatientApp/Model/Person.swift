
import UIKit

class Person : NSObject {
    var salute      : String
    var firstname   : String
    var lastname    : String
    
    var cellPhoneNumber : String
    var homePhoneNumber : String
    var workPhoneNumber : String
    
    var emailAddress    : String
 
    override init() {
        
        self.salute     = ""
        self.firstname  = ""
        self.lastname   = ""
        
        self.cellPhoneNumber = ""
        self.homePhoneNumber = ""
        self.workPhoneNumber = ""
        
        self.emailAddress    = ""
        
    }
}

extension Person {
    func fullname() -> String {
        return firstname + " " + lastname
    }
}