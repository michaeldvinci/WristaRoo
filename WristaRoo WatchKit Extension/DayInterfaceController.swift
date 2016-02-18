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
    let custom = ["Thursday2", "Friday2", "Saturday2", "Sunday2"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? String else {
            return
        }
        
        if context == "Full Schedule" {
            loadTableData()
        } else if context == "Custom Sched." {
            loadCustomSchedule()
        }
        
    }
    
    private func loadTableData() {
        
        rooTable.setNumberOfRows(days.count, withRowType: "DayTableRowController")
        
        for (index, dayName) in days.enumerate() {
            
            let row = rooTable.rowControllerAtIndex(index) as! DayTableRowController
            
            row.dayLabel.setText(dayName)
        }
        
    }
    
    private func loadCustomSchedule() {
        
        rooTable.setNumberOfRows(custom.count, withRowType: "DayTableRowController")
        
        for (index, customName) in custom.enumerate() {
            
            let row = rooTable.rowControllerAtIndex(index) as! DayTableRowController
            
            row.dayLabel.setText(customName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showDays" {
            let dayName = days[rowIndex]
            return dayName
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