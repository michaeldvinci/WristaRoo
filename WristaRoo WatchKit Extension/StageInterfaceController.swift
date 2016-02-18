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
    
    let stageTh = ["What Stage    Th", "Which Stage    Th", "This Tent    Th", "That Tent    Th", "The Other Tent    Th", "Silent Disco    Th", "Christmas Barn    Th"]
    let stageFr = ["What Stage    Fr", "Which Stage    Fr", "This Tent    Fr", "That Tent    Fr", "The Other Tent    Fr", "Silent Disco    Fr", "Christmas Barn    Fr"]
    let stageSa = ["What Stage    Sa", "Which Stage    Sa", "This Tent    Sa", "That Tent    Sa", "The Other Tent    Sa", "Silent Disco    Sa", "Christmas Barn    Sa"]
    let stageSu = ["What Stage    Su", "Which Stage    Su", "This Tent    Su", "That Tent    Su", "The Other Tent    Su", "Silent Disco    Su", "Christmas Barn    Su"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? String else {
            return
        }
        
        if context == "By Stage    Th" {
            loadThStage()
            MyVariables.yourVariable = "sth"
        } else if context == "By Stage    Fr" {
            loadFrStage()
            MyVariables.yourVariable = "sfr"
        } else if context == "By Stage    Sa" {
            loadSaStage()
            MyVariables.yourVariable = "ssa"
        } else if context == "By Stage    Su" {
            loadSuStage()
            MyVariables.yourVariable = "ssu"
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
        
    
    private func loadThStage() {
        
        stageTable.setNumberOfRows(stageTh.count, withRowType: "StageTableRowController")
        
        for (index, stageThName) in stageTh.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageThName)
        }
        
    }
    
    private func loadFrStage() {
        
        stageTable.setNumberOfRows(stageFr.count, withRowType: "StageTableRowController")
        
        for (index, stageFrName) in stageFr.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageFrName)
        }
        
    }
    
    private func loadSaStage() {
        
        stageTable.setNumberOfRows(stageSa.count, withRowType: "StageTableRowController")
        
        for (index, stageSaName) in stageSa.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageSaName)
        }
        
    }
    
    private func loadSuStage() {
        
        stageTable.setNumberOfRows(stageSu.count, withRowType: "StageTableRowController")
        
        for (index, stageSuName) in stageSu.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageSuName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let stageName = stageTh[rowIndex]
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