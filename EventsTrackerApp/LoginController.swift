//
//  LoginController.swift
//  BondVillains
//
//  Created by Anubhav Maity on 12/04/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation
import UIKIt

class LoginContoller:UIViewController{
    
    @IBOutlet weak var name: UITextField!
    var userSession = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitName(sender: UIButton) {
        var userName = name.text
        if userName != "" {
        userSession.setObject(userName, forKey:"userSession")
      let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("TabBar") as UITabBarController
        self.presentViewController(detailController, animated:true, completion:nil)
        }
        
    }
    
    
}
