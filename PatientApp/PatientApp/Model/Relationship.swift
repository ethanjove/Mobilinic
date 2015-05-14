

import UIKit

class Relationship : NSObject {
    var ID : Int
    var Relationship   : String
        
    init (id : Int, desc : String) {
        self.ID = id
        self.Relationship = desc
    }
}