//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit
import RealmSwift

class DayInterfaceController: WKInterfaceController {
    
    @IBOutlet var rooTable: WKInterfaceTable!
    
    static let daysC = ["Thursday", "Friday", "Saturday", "Sunday"]
    
    let realm = try! Realm()
    let days = daysC
    let custom = daysC
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? String else {
            return
        }
        
        if context == "Full Schedule" {
            loadTableData()
            DayVariables.dayGlobal = "full"
        } else if context == "Custom Sched." {
            loadCustomSchedule()
            DayVariables.dayGlobal = "cust"
        }
        
    }
    
    struct DayVariables {
        static var dayGlobal = ""
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
        
        if segueIdentifier == "showDays" && DayVariables.dayGlobal == "full"{
            let dayName = days[rowIndex]
            let choiceA = [dayName, DayVariables.dayGlobal]
            return choiceA
        }
        if segueIdentifier == "showDays" && DayVariables.dayGlobal == "cust"{
            let dayName = custom[rowIndex]
            let choiceA = [dayName, DayVariables.dayGlobal]
            return choiceA
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
    
}