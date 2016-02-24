//
//  ViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    
    let appGroupID = "group.conedmiro.wristaroo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = WCSession.defaultSession()
        session.activateSession()
        
        var customSchedArray: [NSString] = ["test1", "test2"]
        
        let defaults = NSUserDefaults(suiteName: appGroupID)!
        defaults.setObject(customSchedArray, forKey: "arrayCustom")
        defaults.synchronize()
        
        //let myArray = defaults!.objectForKey("array") as! [String]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

