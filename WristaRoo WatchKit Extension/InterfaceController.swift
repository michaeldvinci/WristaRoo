//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var mainTable: WKInterfaceTable!
    
    let mains = ["Full Schedule", "Custom Sched."]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}