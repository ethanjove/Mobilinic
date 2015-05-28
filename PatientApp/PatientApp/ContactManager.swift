
import UIKit

let contactManager = ContactManager ()

class ContactManager {
    
    class var instance: ContactManager {
        return contactManager
    }
    
    func saveContact (contact : Contact) {
        
        if (contact.contactID == 0) {
            insertContact(contact)
        } else {
            updateContact(contact)
        }
        
    }
    
    func insertContact (contact : Contact) {
        
        let stmt = "INSERT INTO Contact (" +
                "  ContactID" +
                ", FirstName" +
                ", LastName" +
                ", RelationTypeID" +
                ", CreatedAt" +
            ") VALUES (?, ?, ?, ?, ?)"
        
        dbInstance.localDB!.open()
        let currentDateTime = NSDate()
        contact.contactID = Int(arc4random_uniform(10000))
        
        let insertSuccesfull = dbInstance.localDB?.executeUpdate(stmt, withArgumentsInArray:
            [ contact.contactID
                ,contact.firstname
                ,contact.lastname
                ,contact.relationTypeID
                ,currentDateTime])
        
        if (insertSuccesfull == false) {
            println("Insert failed : \(dbInstance.localDB?.lastErrorMessage())")
        }
        dbInstance.localDB!.close()
        
    }

    func updateContact (contact : Contact) {
        
        let stmt = "UPDATE Contact " +
                "SET " +
                "  FirstName  = ?" +
                ", LastName   = ?" +
                ", RelationTypeID = ?" +
                ", ModifiedAt = ?" +
            " WHERE ContactID = ?"
       
        dbInstance.localDB!.open()
        let currentDateTime = NSDate()
        
        let updateSuccesfull = dbInstance.localDB?.executeUpdate(stmt, withArgumentsInArray:
            [ contact.firstname.capitalizedString
             ,contact.lastname.capitalizedString
             ,contact.relationTypeID
             ,currentDateTime
             ,contact.contactID])
        
        if (updateSuccesfull == false) {
            println("Update failed : \(dbInstance.localDB?.lastErrorMessage())")
        }
        dbInstance.localDB!.close()
        
    }

    
    func loadContacts() -> Array<Contact> {
        
        var contactList : Array<Contact> = []
        
        let sql = "SELECT " +
            " ContactID" +
            ",FirstName" +
            ",LastName" +
            ",RelationTypeID" +
        " FROM Contact " +
        " ORDER By FirstName, LastName"
        
        dbInstance.localDB!.open()
        
        var resultSet: FMResultSet! = dbInstance.localDB!.executeQuery(sql, withArgumentsInArray: nil)
        //println("resultSet : \(dbInstance.localDB?.lastErrorMessage())")
        
        if (resultSet != nil) {
            while resultSet.next() {
            
                var contact = Contact()
                contact.contactID   = Int(resultSet.intForColumn("ContactID"))
                contact.firstname   = resultSet.stringForColumn("FirstName")
                contact.lastname    = resultSet.stringForColumn("LastName")
                contact.relationTypeID = Int(resultSet.intForColumn("RelationTypeID"))
                
                contactList.append(contact)
            }
        }
        
        dbInstance.localDB!.close()
        
        return contactList
        
    }
    
}