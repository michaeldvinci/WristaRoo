//
//  StageActInterfaceController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/18/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class StageActInterfaceController: WKInterfaceController {
    
    @IBOutlet var stageActTable: WKInterfaceTable!
    
    
    let rowTypes = ["Time", "Act",
                    "Time", "Act",
                    "Time", "Act",
                    "Time", "Act",
                    "Time", "Act",
                    "Time", "Act"]
    let byTimeA = [ "5:45 - 6:30", "Unlocking the Truth",
                    "7:00 - 7:45", "Strand of Oaks",
                    "8:15 - 9:00", "Iceage",
                    "9:30 - 10:15", "The Growlers",
                    "10:45 - 11:30", "Courtney Barnett",
                    "12:15 - 1:00", "Mac DeMarco"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        rebuildTable()
    }
    
    private func rebuildTable() {
        
        stageActTable.setRowTypes(rowTypes)
        for var rowIndex = 0; rowIndex < rowTypes.count; rowIndex++ {
            switch rowTypes[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(byTimeA[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(byTimeA[rowIndex])
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