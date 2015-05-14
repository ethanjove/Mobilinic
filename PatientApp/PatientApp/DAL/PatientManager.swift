
import UIKit

let patientManager = PatientManager ()

class PatientManager {
 
    class var instance: PatientManager {
        return patientManager
    }
    
    func savePatient () {
        
        let stmt = "UPDATE Patient SET" +
                    "  FirstName    = ?" +
                    ", LastName     = ?" +
                    ", Gender       = ?" +
                    ", DateOfBirth  = ?" +
                    ", BloodType    = ?" +
                    ", HeightCm     = ?" +
                    ", HeightFt     = ?" +
                    ", HeightInch   = ?" +
                    ", WeightKg     = ?" +
                    ", WeightLb     = ?" +
                    ", IsOrganDonor = ?"
        
        dbInstance.localDB!.open()
        
        /*
        println(Patient.sharedInstance.firstname)
        println(Patient.sharedInstance.lastname)
        println(Patient.sharedInstance.genderCode)
        println(Patient.sharedInstance.bloodType)
        println(String(Patient.sharedInstance.heightCm))
        println(String(Patient.sharedInstance.heightFt))
        println(String(Patient.sharedInstance.heightInch))
        */
        
        let paramWeightKg = NSNumber(double: Patient.sharedInstance.weightKg)
        let paramWeightLb = NSNumber(double: Patient.sharedInstance.weightLb)
        
        
        let updateSuccesfull = dbInstance.localDB?.executeUpdate(stmt, withArgumentsInArray:
                     [Patient.sharedInstance.firstname
                     ,Patient.sharedInstance.lastname
                     ,Patient.sharedInstance.genderCode
                     ,Patient.sharedInstance.dateOfBirth
                     ,Patient.sharedInstance.bloodType
                     ,NSNumber(int : Int32(Patient.sharedInstance.heightCm))
                     ,NSNumber(int : Int32(Patient.sharedInstance.heightFt))
                     ,NSNumber(int : Int32(Patient.sharedInstance.heightInch))
                     ,paramWeightKg
                     ,paramWeightLb
                     ,Patient.sharedInstance.isOrganDonor])
        
        if (updateSuccesfull == false) {
            println("Update failed : \(dbInstance.localDB?.lastErrorMessage())")
        }
        dbInstance.localDB!.close()
        
    }
    
    func loadPatient() {
        
        let sql = "SELECT " +
                    " PatientID" +
                    ",FirstName" +
                    ",LastName" +
                    ",Gender" +
                    ",DateOfBirth" +
                    ",BloodType" +
                    ",HeightCm" +
                    ",HeightFt" +
                    ",HeightInch" +
                    ",WeightKg" +
                    ",WeightLb" +
                    ",IsOrganDonor" +
                  " FROM Patient"
        
        dbInstance.localDB!.open()
        
        var resultSet: FMResultSet! = dbInstance.localDB!.executeQuery(sql, withArgumentsInArray: nil)
        //println("resultSet : \(dbInstance.localDB?.lastErrorMessage())")
        
        if (resultSet != nil) {
            while resultSet.next() {
                
                if (resultSet.stringForColumn("DateOfBirth").isEmpty == false) {
                    Patient.sharedInstance.dateOfBirth  = resultSet.dateForColumn("DateOfBirth")
                }
                
                Patient.sharedInstance.firstname    = resultSet.stringForColumn("FirstName")
                Patient.sharedInstance.lastname     = resultSet.stringForColumn("LastName")
                Patient.sharedInstance.genderCode   = resultSet.stringForColumn("Gender")
                Patient.sharedInstance.bloodType    = resultSet.stringForColumn("BloodType")
                Patient.sharedInstance.heightCm     = Int(resultSet.intForColumn("HeightCm"))
                Patient.sharedInstance.heightFt     = Int(resultSet.intForColumn("HeightFt"))
                Patient.sharedInstance.heightInch   = Int(resultSet.intForColumn("HeightInch"))
                Patient.sharedInstance.weightKg     = resultSet.doubleForColumn("WeightKg")
                Patient.sharedInstance.weightLb     = resultSet.doubleForColumn("WeightLb")
                Patient.sharedInstance.weightLb     = resultSet.doubleForColumn("WeightLb")
                Patient.sharedInstance.isOrganDonor = resultSet.stringForColumn("IsOrganDonor")
                
            }
        }
        
        dbInstance.localDB!.close()
        
    }
    
}