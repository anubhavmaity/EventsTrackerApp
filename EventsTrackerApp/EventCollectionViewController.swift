//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Anubhav Maity
//  Copyright (c) 2015 Anubhav Maity. All rights reserved.//

import Foundation

import UIKit

class EventCollectionViewController: UIViewController, UICollectionViewDataSource {
    
   
    let allEvents = Event.allEvents
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allEvents.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("EventCollectionViewCell", forIndexPath: indexPath) as EventCollectionViewCell
        let event = self.allEvents[indexPath.row]
        
        // Set the name and image
        cell.Event.text = event.name
        cell.EventImage?.image = UIImage(named: event.image)
 
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("EventDetailViewController") as EventDetailViewController
        detailController.event = self.allEvents[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            println("Swipe Left")
            let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("TrackingListView") as TrackingListViewController
            self.navigationController!.pushViewController(detailController, animated: true)
            
        }
    }
    
}
