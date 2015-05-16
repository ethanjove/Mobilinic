

import UIKit

let dbInstance = DatabaseManager()

class DatabaseManager: NSObject {
    
    var localDB: FMDatabase? = nil;
    
    /*
    override init() {
        super.init()
        
        let filemgr = NSFileManager.defaultManager();
        
        let docsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true).first as String
        
        let databasePath = docsDir.stringByAppendingPathComponent("Mobilinic.sqlite")
        
        dbInstance.localDB = FMDatabase(path: databasePath)
        
    }
    */
    class var instance: DatabaseManager {
        dbInstance.localDB = FMDatabase(path: Util.getPath("Mobilinic.sqlite"))
        var path = Util.getPath("Mobilinic.sqlite")
        
        //println("path : \(path)")
        return dbInstance
    }
    
    /*
    override init() {
        super.init()
        let filemgr = NSFileManager.defaultManager();
        
        let docsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true).first as String
        
        let databasePath = docsDir.stringByAppendingPathComponent("Mobilinic.sqlite3")
        
        sharedInstance.mobilinicDb = Database(databasePath);
        
        self.createDataModel()
        
    }

    func createDataModel() {
        
        //dropPatientTable();
        
        let DeviceID    = Expression<String>("DeviceID")
        let PatientID   = Expression<Int?>("PatientID")
        let FirstName   = Expression<String?>("FirstName")
        let LastName    = Expression<String?>("LastName")
        let Gender      = Expression<String?>("Gender")
        let DateOfBirth = Expression<String?>("DateOfBirth")
        let BloodType   = Expression<String?>("BloodType")
        let HeightCm    = Expression<Int?>("HeightCm")
        let HeightFt    = Expression<Int?>("HeightFt")
        let HeightIn    = Expression<Int?>("HeightIn")
        let IsDonor     = Expression<Int?>("IsDonor")
        let LastUpdateDate = Expression<Int?>("LastUpdateDate")
        
        let patient     = sharedInstance.mobilinicDb["Patient"]
        
        sharedInstance.mobilinicDb.create(table: patient) {
            t in
            t.column(DeviceID, primaryKey:true)
            
        }

        var sql =
            "CREATE TABLE IF NOT EXISTS " +
            "Patient (" +
                " DeviceID varchar(100) NOT NULL PRIMARY KEY " +
                ",PatientID int" +
                ",FirstName varchar(50)" +
                ",LastName varchar(50)" +
                ",Gender varchar(1)" +
                ",DateOfBirth date" +
                ",BloodType varchar(3)" +
                ",HeightCm smallint" +
                ",HeightFt tinyint" +
                ",HeightIn tinyint" +
                ",IsDonor bit" +
                ",LastUpdateDate datetime" +
            ")"
    
    }


    func dropPatientTable() {
        var sql = "DROP TABLE IF EXISTS Patient"
        dbInstance.localDB?.executeStatements(sql)
        
    }
    */
}
