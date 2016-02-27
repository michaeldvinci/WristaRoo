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
    
    
    let stageThisTh = ["Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act"]
    let actThisTh = [ "5:45 - 6:30", "Unlocking the Truth",
        "7:00 - 7:45", "Strand of Oaks",
        "8:15 - 9:00", "Iceage",
        "9:30 - 10:15", "The Growlers",
        "10:45 - 11:30", "Courtney Barnett",
        "12:15 - 1:00", "Mac DeMarco"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
       
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "This Tent" && context[1] as! String == "th"{
            thThis()
        }
        
    }
    
    private func thThis() {
        
        stageActTable.setRowTypes(stageThisTh)
        for var rowIndex = 0; rowIndex < stageThisTh.count; rowIndex++ {
            switch stageThisTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actThisTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actThisTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "showByTimes" {
            let mainName = stageThisTh[rowIndex]
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
    
}