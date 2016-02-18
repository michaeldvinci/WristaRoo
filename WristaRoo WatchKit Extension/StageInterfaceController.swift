//
//  StageInterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class StageInterfaceController: WKInterfaceController {
    
    @IBOutlet var stageTable: WKInterfaceTable!
    
    let stage = ["What Stage", "Which Stage", "This Tent", "That Tent", "The Other Tent", "Silent Disco", "Christmas Barn"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadTableData()
    }
    
    private func loadTableData() {
        
        stageTable.setNumberOfRows(stage.count, withRowType: "StageTableRowController")
        
        for (index, stageName) in stage.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let stageName = stage[rowIndex]
        return stageName
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