//
//  TrackingListViewController.swift
//  BondVillains
//
//  Created by Anubhav Maity on 12/04/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class TrackingListViewController: UIViewController{
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var myNewDictArray: [String] = []
    var username: String = ""
    var userSession = NSUserDefaults.standardUserDefaults()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let userName: AnyObject  = userSession.objectForKey("userSession"){
            username = userSession.objectForKey("userSession") as String
            print(username)
        }
        if let data: AnyObject = userDefaults.objectForKey(username){
            myNewDictArray = userDefaults.objectForKey(username) as Array
            print(myNewDictArray)
            return myNewDictArray.count
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.setEditing(true, animated:false)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell") as UITableViewCell
        if let userName: AnyObject  = userSession.objectForKey("userSession"){
            username = userSession.objectForKey("userSession") as String
        }
        
        if let data: AnyObject = userDefaults.objectForKey(username){
            myNewDictArray = userDefaults.objectForKey(username) as Array
            cell.textLabel?.text = myNewDictArray[indexPath.row]
        }
        // Set the name and image
        //cell.textLabel?.text = villain.name
        //cell.imageView?.image = UIImage(named: villain.imageName)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            print(indexPath.row)
            myNewDictArray.removeAtIndex(indexPath.row)
            userDefaults.setObject(myNewDictArray, forKey:username)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool{
        return true;
    }
    
    // Process the row move. This means updating the data model to correct the item indices.
    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!){
        let item : String = myNewDictArray[sourceIndexPath.row];
        myNewDictArray.removeAtIndex(sourceIndexPath.row);
        myNewDictArray.insert(item, atIndex: destinationIndexPath.row)
    }
}
