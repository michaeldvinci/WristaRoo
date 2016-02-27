//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var watchSession: WCSession!
    var key = "keyRoo"
    
    @IBOutlet var mainTable: WKInterfaceTable!
    
    let mains = ["Full Schedule", "Custom Sched."]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if (WCSession.isSupported()) {
            watchSession = WCSession.defaultSession()
            watchSession.delegate = self;
            watchSession.activateSession()
            print(" ")
            print("CONNECTED!2")
            print("CONNECTED!2")
            print("CONNECTED!2")
        }
        
        loadTableData()
    }
    
    private func loadTableData() {
        mainTable.setNumberOfRows(mains.count, withRowType: "InterfaceTableRowController")
        for (index, mainName) in mains.enumerate() {
            let row = mainTable.rowControllerAtIndex(index) as! InterfaceTableRowController
            row.interfaceLabel.setText(mainName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        if segueIdentifier == "showSchedule" {
            let mainName = mains[rowIndex]
            return mainName
        }
        return nil
    }
    
    
    override func willActivate() {
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            if let retrievedArray1 = applicationContext["Array1"] as? [String] {
                NSUserDefaults.standardUserDefaults().setObject(retrievedArray1, forKey: "keyRoo")
            }
        }
    }

    
}