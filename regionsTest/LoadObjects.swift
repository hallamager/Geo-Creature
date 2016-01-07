import Foundation

class loadObjects {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func hasFoundObject(name: String) -> Bool {
        if defaults.boolForKey(name) {
            return true
        }
        return false
    }
    
    func saveObject(name: String) {
        defaults.setBool(true, forKey: name)
    }
    
    func removeObject(name: String) {
        defaults.setBool(false, forKey: name)
    }
    
}