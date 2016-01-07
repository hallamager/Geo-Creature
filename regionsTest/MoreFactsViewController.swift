import UIKit

class MoreFactsViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dino: Dino!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}

extension MoreFactsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dino.facts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        let fact = dino.facts[indexPath.row]
        
        let titleLabel = cell?.viewWithTag(1) as! UILabel
        titleLabel.text = fact
                
        
        return cell!
    }
    
}

