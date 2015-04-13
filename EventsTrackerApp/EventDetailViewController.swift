//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jason on 12/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

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
        
        //self.imageView!.image = UIImage(named: villain.imageName)
        self.place.text = self.event.place
        self.fees.text = self.event.fees
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
        if let userName: AnyObject  = userSession.objectForKey("userSession"){
            username = userSession.objectForKey("userSession") as String
            print(username)
        }
        //print(fetchAllActors())
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
