
import UIKit;

class StoryboardManager : NSObject {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func dashboardStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Dashboard", bundle: nil)
    }
    
    class func healthdataStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "HealthData", bundle: nil)
    }

    class func communityStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Community", bundle: nil)
    }

    class func settingsStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Settings", bundle: nil)
    }
    
        class func patientSettingsStoryboard() -> UIStoryboard {
            return UIStoryboard(name: "PatientSettings", bundle: nil)
        }
        class func contactSettingsStoryboard() -> UIStoryboard {
            return UIStoryboard(name: "ContactSettings", bundle: nil)
        }
    
    
    class func dashboardNC() -> DashboardNC {
        
        return dashboardStoryboard().instantiateViewControllerWithIdentifier("DashboardNC") as! DashboardNC
    }
    
    class func healthDataVC() -> HealthDataVC {
        
        return healthdataStoryboard().instantiateViewControllerWithIdentifier("HealthDataView") as! HealthDataVC
    }
    
    class func communityVC() -> CommunityVC {
        
        return communityStoryboard().instantiateViewControllerWithIdentifier("CommunityView") as! CommunityVC
    }
    
    class func settingsVC() -> SettingsVC {
        
        return settingsStoryboard().instantiateViewControllerWithIdentifier("SettingsView") as! SettingsVC
    }
    
        class func patientSettingsVC() -> PatientSettingsVC {
            
            return patientSettingsStoryboard().instantiateViewControllerWithIdentifier("PatientSettingsView") as! PatientSettingsVC
        }
        class func contactSettingsVC() -> ContactListVC {
            return contactSettingsStoryboard().instantiateViewControllerWithIdentifier("ContactListView") as! ContactListVC
        }

}