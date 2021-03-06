//
//  ViewController.swift
//  EventsTrackerApp
//
//  Created by Anubhav
//  Copyright (c) 2015 Anubhav Maity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as CustomCellTableViewCell
        let event = self.allEvents[indexPath.row]
        
        cell.Event.text = event.name
        cell.Image?.image = UIImage(named:event.image)
        
      
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
