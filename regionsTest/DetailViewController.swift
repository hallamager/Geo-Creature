import UIKit
import CoreLocation

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var youFound: UILabel!
    
    @IBOutlet weak var factsLabel: UILabel!
    
    
    @IBOutlet weak var dinoImage: UIImageView!
    
    
    @IBOutlet weak var addButton: UIButton!
    
    var buttonHidden = false
    
    var dinoName: String!
    var dino: Dino!
    var facts: String!
    var found: Bool!
    let loader = loadObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add to log button will only appear the first time you visit detail view controller.
        
        addButton.hidden = buttonHidden
        
        dino = loadDino(dinoName)
        
        print(dino.name)
        
        //will change background to the dinosaur that has been found.
        
        dinoImage.image = UIImage(named: dino.name)
        
        //will change text to the dinosaur that has been found.
        
        youFound.text = "Hi I'm a \(dino.name)"
        factsLabel.text = "\(dino.fact)"
                
        loader.saveObject(dino.name)

    }
    
    //back button code
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //prepares segue to log view controller
        
        if segue.identifier == "Add" {
            let vc = segue.destinationViewController as! LogViewController
            vc.foundDino = dino.name
        }
        
        //prepares segue to more facts view controller

        
        if segue.identifier == "Facts" {
            let vc = segue.destinationViewController as! MoreFactsViewController
            vc.dino = dino
        }
        
        
        
    }
    
    
}

