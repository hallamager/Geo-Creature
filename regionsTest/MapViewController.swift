//
//  ViewController.swift
//  regionsTest
//
//  Created by Hallam John Ager on 03/11/2015.
//  Copyright © 2015 Hallam John Ager. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AudioToolbox
import AVFoundation

class MapViewController: UIViewController {
    

    var foundItem: String?
    let dinos = buildDinos()
    var isShowing = false
    let loader = loadObjects()
    var audioPlayer = AVAudioPlayer()


    
    @IBOutlet weak var myMap: MKMapView!
    
    //you are here images
    @IBOutlet weak var youarehere1: UIImageView!
    @IBOutlet weak var youarehere2: UIImageView!
    @IBOutlet weak var youarehere3: UIImageView!
    @IBOutlet weak var chest: UIImageView!
    @IBOutlet weak var chest1: UIImageView!
    @IBOutlet weak var chest2: UIImageView!
    
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self

        myMap.setUserTrackingMode(.Follow, animated: true)
        
        for dino in dinos {
            locationManager.startMonitoringForRegion(dino.region)
        }
        
        if loader.hasFoundObject("T-Rex") {
            chest.image = UIImage(named: "chestT-Rex")
        }
        
        if loader.hasFoundObject("Teradaxtyl") {
            chest1.image = UIImage(named: "chestTeradaxtyl")
        }
        
        if loader.hasFoundObject("Eoraptor") {
            chest2.image = UIImage(named: "chestEoraptor")
        }

        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for dino in dinos {
            dino.region.notifyOnEntry = true
            dino.region.notifyOnExit = false
        }
        isShowing = false
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Next" {
            let vc = segue.destinationViewController as! DetailViewController
            vc.dinoName = foundItem!
            isShowing = true
        }
    }
    
    @IBAction func clueAlert() {
        
        let title = "Your Clue Is:"
        let message = "The fossil on the ground"
        let okText = "Ok"
        
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func clueAlert2(sender: UIButton) {
        
        let title = "Your Clue Is:"
        let message = "On the sand with cover"
        let okText = "Ok"
        
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func clueAlert3(sender: UIButton) {
        
        let title = "Your Clue Is:"
        let message = "The end of the line that zips"
        let okText = "Ok"
        
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func howToPlay(sender: UIButton) {
        
        let title = "How To Play"
        let message = "Press the clue button on the island that you wish to find a dinosaur. After that go ahead and explore and learn about these amazing creatures!"
        let okText = "Ok"
        
        let alert = UIAlertController(title: title, message: message,preferredStyle: UIAlertControllerStyle.Alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okayButton)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Leaving \(region.identifier)")
        
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")
        
        if !isShowing {
            
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            
            let myFilePathString = NSBundle.mainBundle().pathForResource("trexRoar", ofType: "wav")
            
            if let myFilePathString = myFilePathString {
                
                let myFilePathURL = NSURL (fileURLWithPath: myFilePathString)
                
                do{
                    try audioPlayer = AVAudioPlayer(contentsOfURL: myFilePathURL)
                    
                    audioPlayer.play()
                    print("Playing")
                    
                }catch
                {
                    print("error")
                }
            }
            
        
            let refreshAlert = UIAlertController(title: "Discovery!", message: "You discovered a \(region.identifier) fossil, Congraulations", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            refreshAlert.addAction(UIAlertAction(title: "More Info", style: .Default, handler: { (action: UIAlertAction!) in
                self.foundItem = region.identifier
                self.performSegueWithIdentifier("Next", sender: self)
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                
                refreshAlert .dismissViewControllerAnimated(true, completion: nil)
                
                
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            
            if region.identifier == "T-Rex" {
                
                youarehere1.alpha = 0
                UIView.animateWithDuration(2.0) {
                    self.youarehere1.alpha = 1
                }
                
                youarehere3.alpha = 0
                youarehere2.alpha = 0
                
            }
            
            if region.identifier == "Eoraptor" {
                
                youarehere3.alpha = 0
                UIView.animateWithDuration(2.0) {
                    self.youarehere3.alpha = 1
                }
                
                youarehere1.alpha = 0
                youarehere2.alpha = 0
                
            }
            
            if region.identifier == "Teradaxtyl" {
                
                youarehere2.alpha = 0
                UIView.animateWithDuration(2.0) {
                    self.youarehere2.alpha = 1
                }
                
                youarehere3.alpha = 0
                youarehere1.alpha = 0
                
            }
        }
        
    }
    
}






