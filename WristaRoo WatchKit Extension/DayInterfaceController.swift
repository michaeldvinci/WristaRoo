//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class DayInterfaceController: WKInterfaceController {
    
    @IBOutlet var rooTable: WKInterfaceTable!
    
    let days = ["Thursday", "Friday", "Saturday", "Sunday"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadTableData()
    }
    
    private func loadTableData() {
        
        rooTable.setNumberOfRows(days.count, withRowType: "DayTableRowController")
        
        for (index, dayName) in days.enumerate() {
            
            let row = rooTable.rowControllerAtIndex(index) as! DayTableRowController
            
            row.dayLabel.setText(dayName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let dayName = days[rowIndex]
        return dayName
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