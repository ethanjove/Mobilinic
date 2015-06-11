
import UIKit

class Language : NSObject {
    var code        : String
    var language    : String
    var languageInLocal    : String
    
    
    override init() {
        
        self.code     = ""
        self.language  = ""
        self.languageInLocal   = ""
        
    }
    
    init (code: String, language : String, languageInLocal : String) {
        self.code     = code
        self.language  = language
        self.languageInLocal   = languageInLocal
        
    }
}
