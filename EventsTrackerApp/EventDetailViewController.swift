//
//  
//  EventsTrackerApp
//
//  Created by Anubhav Maity
//  Copyright (c) 2015 Anubhav Maity. All rights reserved.//

import UIKit
import CoreData

class EventDetailViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var trackButton: UIButton!
    
    var event: Event!
    var myNewDictArray: [String] = []
    var username: String = ""
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var userSession = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var fees: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.event.name
       
        self.place.text = self.event.place
        self.fees.text = self.event.fees
        self.imageView?.image = UIImage(named:self.event.image)
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        if let userName: AnyObject  = userSession.objectForKey("userSession"){
            username = userSession.objectForKey("userSession") as String
            print(username)
        }
        
        if let data: AnyObject = userDefaults.objectForKey(username){
            myNewDictArray = userDefaults.objectForKey(username) as Array
            if contains(myNewDictArray, self.label.text!){
                trackButton.enabled = false
            }
            
        }
        
    }
   
    
    @IBAction func trackEvent(sender: UIButton) {
       
        var trackEvent: String = self.label.text!
        
        
        
        myNewDictArray.append(trackEvent)
        userDefaults.setObject(myNewDictArray, forKey:username)
        
        trackButton.enabled = false
        print(userDefaults.objectForKey(username))
        
    }
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            println("Swipe Left")
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("TrackingListView") as TrackingListViewController
            self.navigationController!.pushViewController(detailController, animated: true)
            
        }
    }
    
    
    
}
