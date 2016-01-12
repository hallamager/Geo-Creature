import UIKit

class LogViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var foundDino: String?
    
    
    let dinos = buildDinos()
    let loader = loadObjects()
    
    var selectedDino: Dino?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let foundDino = foundDino {
            loader.saveObject(foundDino)
        }
        
    }
    
    //preparing segue to go back to detail view controller that will not show add to log button.
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDino" {
            let vc = segue.destinationViewController as! DetailViewController
            vc.dinoName = selectedDino!.name
            vc.buttonHidden = true
        }
    }
    
    //back button code.
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

//log table view code. Log will change information of the table view to which dinosaurs have been found.


extension LogViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dinos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        let dino = dinos[indexPath.row]
        
        //adding the label into the table view cell
        
        let titleLabel = cell?.viewWithTag(1) as! UILabel
        titleLabel.text = dino.name
        
        //adding the image into the table view cell

        
        let imageView = cell?.viewWithTag(2) as! UIImageView
        
        //images within the table view will be grey when not found and have colour when they are found.
        
        if loader.hasFoundObject(dino.name) {
            cell?.accessoryType = .Checkmark
            imageView.image = UIImage(named: dino.name + "Colour")
        } else {
            titleLabel.alpha = 0.3
            imageView.image = UIImage(named: dino.name + "Grey")
        }
        
        return cell!
    }
    
}

extension LogViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let dino = dinos[indexPath.row]
        //when selecting this row the animation will disappear.
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //only if the user as found object can they go back to the detail view controller.
        if loader.hasFoundObject(dino.name) {
            selectedDino = dinos[indexPath.row]
            performSegueWithIdentifier("ShowDino", sender: self)
        }
        selectedDino = dinos[indexPath.row]
    }
    
}