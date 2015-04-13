//
//  Villain.swift
//  BondVillains
//
//  Created by Anubhav Maity
//  Copyright (c) 2015 Anubhav Maity. All rights reserved.
//

import Foundation
import UIKit


struct Event {
    
    let name: String
    let place: String
    let fees: String
    let image: String
    
    static let NameKey = "NameKey"
    static let PlaceKey = "PlaceKey"
    static let FeesKey = "FeesKey"
    static let ImageKey = "ImageKey"
    
    // Generate a Villain from a three entry dictionary

    init(dictionary: [String : String]) {
    
        self.name = dictionary[Event.NameKey]!
        self.place = dictionary[Event.PlaceKey]!
        self.fees = dictionary[Event.FeesKey]!
        self.image = dictionary[Event.ImageKey]!
    }
}


/**
* This extension adds static variable allVillains. An array of Villain objects
*/

extension Event {

    // Generate an array full of all of the villains in
    static var allEvents: [Event] {
        
        var eventArray = [Event]()
        
        for d in Event.localEventData() {
            eventArray.append(Event(dictionary: d))
        }
        
        return eventArray
    }
    
    static func localEventData() -> [[String : String]] {
        return [
            [Event.NameKey : "Metallica Concert", Event.PlaceKey : "Palace Grounds",  Event.FeesKey : "paid entry", Event.ImageKey: "metallica"],
            [Event.NameKey : "Saree Exhibition", Event.PlaceKey : "Malleswaram Grounds",  Event.FeesKey : "free entry", Event.ImageKey: "saree"],
            [Event.NameKey : "Wine tasting event", Event.PlaceKey : "Links Brewery",  Event.FeesKey : "paid entry", Event.ImageKey: "wine"],
            [Event.NameKey : "Startups Meet", Event.PlaceKey : "Kanteerava Indoor Stadium",  Event.FeesKey : "paid entry", Event.ImageKey: "startups"],
            [Event.NameKey : "Summer Noon Party", Event.PlaceKey : "Kumara Park",  Event.FeesKey : "paid entry", Event.ImageKey: "summer"],
            [Event.NameKey : "Rock and Roll nights", Event.PlaceKey : "Sarjapur Road", Event.FeesKey : "paid entry", Event.ImageKey: "rock"],
            [Event.NameKey : "Barbecue Fridays", Event.PlaceKey : "Whitefield",  Event.FeesKey : "paid entry", Event.ImageKey: "barbecue"],
            [Event.NameKey : "Summer workshop", Event.PlaceKey : "Indiranagar",  Event.FeesKey : "free entry", Event.ImageKey: "summerwork"],
            [Event.NameKey : "Impressions & Expressions", Event.PlaceKey : "MG Road",  Event.FeesKey : "free entry", Event.ImageKey: "impressions"],
            [Event.NameKey : "Italian carnival", Event.PlaceKey : "Electronic City",  Event.FeesKey : "free entry", Event.ImageKey: "italian"],
            
        ]
    }
}