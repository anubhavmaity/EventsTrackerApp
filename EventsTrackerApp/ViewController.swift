//
//  ViewController.swift
//  BondVillains
//
//  Created by Jason on 11/19/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allEvents = Event.allEvents
    
    // MARK: Table View Data Source
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
      
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allEvents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("VillainCell") as CustomCellTableViewCell
        let event = self.allEvents[indexPath.row]
        
        // Set the name and image
        //cell.textLabel?.text = villain.name
        //cell.imageView?.image = UIImage(named: villain.imageName)
        cell.Event.text = event.name
        
        // If the cell has a detail label, we will put the evil scheme in.
        if let placeTextLabel = cell.Place {
            placeTextLabel.text = "Place: \(event.place)"
        }
        
        if let feeslTextLabel = cell.Fees {
            feeslTextLabel.text = "\(event.fees)"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
