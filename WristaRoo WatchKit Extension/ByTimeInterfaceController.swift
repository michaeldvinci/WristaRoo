//
//  ByTimeInterfaceController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/18/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class ByTimeInterfaceController: WKInterfaceController {
    
    static let xmas = "Christmas Barn"
    static let other = "The Other Tent"
    static let this = "This Tent"
    static let that = "That Tent"
    static let disco = "Silent Disco"
    
    @IBOutlet var ByTimeTable: WKInterfaceTable!
    
    let rowTypes = ["Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location", "Time", "Act", "Location"]
    let byTimeA = [ "4:00 - 6:30", "Tiki Disco", xmas,
                    "5:30 - 8:30", "Quickie Mart", disco,
                    "5:45 - 6:30", "Unlocking the Truth", this,
                    "6:00 - 6:45", "DMAs", other,
                    "6:45 - 7:30", "Dej Loaf", that,
                    "7:00 - 7:45", "Strand of Oaks", this,
                    "7:00 - 8:00", "New Breed Brass Band", xmas,
                    "7:15 - 8:00", "Ryan Weazver", other,
                    "8:00 - 8:45", "Dopapod", that,
                    "8:15 - 12:30", "Full Service Party", xmas,
                    "8:15 - 9:00", "Iceage", this,
                    "8:30 - 9:15", "Temples", other,
                    "8:30 - 10:30", "The Unsheathed", disco,
                    "9:15 - 10:00", "Houndmouth", that,
                    "9:30 - 10:15", "The Growlers", this,
                    "9:45 - 10:30", "Glass Animals", other,
                    "10:30 - 11:30", "Tove Lo", that,
                    "10:30 - 12:00", "Matoma", disco,
                    "10:45 - 11:30", "courtney Barnett", this,
                    "1100 - 11:45", "Benjamin Booker", other,
                    "12:00 - 1:00", "Jungle", that,
                    "12:00 - 2:00", "Quickie Mart", disco,
                    "12:15 - 1:00", "Mac DeMarco", this,
                    "12:15 - 1:15", "Gramatik", other,
                    "1:00 - 2:00", "Snicklefritz", xmas,
                    "2:30 - 6:00", "Tiki Disco", xmas]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        rebuildTable()
    }
    
    private func rebuildTable() {
        
        ByTimeTable.setRowTypes(rowTypes)
        for var rowIndex = 0; rowIndex < rowTypes.count; rowIndex++ {
            switch rowTypes[rowIndex] {
                case "Time":
                    let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! TimeTableRowController
                    row.timeLabel.setText(byTimeA[rowIndex])
                case "Act":
                    let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! ActTableRowController
                    row.actLabel.setText(byTimeA[rowIndex])
                case "Location":
                    let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! LocationTableRowController
                    row.locationLabel.setText(byTimeA[rowIndex])
                default:
                    print("nope")
            }
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "showByTimes" {
            let mainName = rowTypes[rowIndex]
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