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
        
        addButton.hidden = buttonHidden
        
        dino = loadDino(dinoName)
        
        print(dino.name)
        
        dinoImage.image = UIImage(named: dino.name)
        
        youFound.text = "Hi I'm a \(dino.name)"
        factsLabel.text = "\(dino.fact)"
                
        loader.saveObject(dino.name)

    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Add" {
            let vc = segue.destinationViewController as! LogViewController
            vc.foundDino = dino.name
        }
        
        if segue.identifier == "Facts" {
            let vc = segue.destinationViewController as! MoreFactsViewController
            vc.dino = dino
        }
        
        
        
    }
    
    
}

