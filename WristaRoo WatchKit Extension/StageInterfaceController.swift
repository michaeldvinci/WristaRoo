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
    
    let stages : [String] = ["What Stage", "Which Stage", "This Tent", "That Tent", "The Other Tent", "Silent Disco", "Christmas Barn"]
    
    //let stageTh = stages
    //let stageFr = stages
    //let stageSa = stages
    //let stageSu = stages
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "By Stage" && context[1] as! String == "th"{
            loadThStage()
            MyVariables.yourVariable = "th"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "fr"{
            loadFrStage()
            MyVariables.yourVariable = "fr"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "sa"{
            loadSaStage()
            MyVariables.yourVariable = "sa"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "su"{
            loadSuStage()
            MyVariables.yourVariable = "su"
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
        
    
    private func loadThStage() {
        
        stageTable.setNumberOfRows(stages.count, withRowType: "StageTableRowController")
        
        for (index, stageThName) in stages.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageThName)
        }
        
    }
    
    private func loadFrStage() {
        
        stageTable.setNumberOfRows(stages.count, withRowType: "StageTableRowController")
        
        for (index, stageFrName) in stages.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageFrName)
        }
        
    }
    
    private func loadSaStage() {
        
        stageTable.setNumberOfRows(stages.count, withRowType: "StageTableRowController")
        
        for (index, stageSaName) in stages.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageSaName)
        }
        
    }
    
    private func loadSuStage() {
        
        stageTable.setNumberOfRows(stages.count, withRowType: "StageTableRowController")
        
        for (index, stageSuName) in stages.enumerate() {
            
            let row3 = stageTable.rowControllerAtIndex(index) as! StageTableRowController
            
            row3.stageLabel.setText(stageSuName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showStageAct" && MyVariables.yourVariable == "th"{
            let stage = stages[rowIndex]
            let stageA = [stage, MyVariables.yourVariable]
            return stageA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "fr"{
            let stage = stages[rowIndex]
            let stageA = [stage, MyVariables.yourVariable]
            return stageA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "sa"{
            let stage = stages[rowIndex]
            let stageA = [stage, MyVariables.yourVariable]
            return stageA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "su"{
            let stage = stages[rowIndex]
            let stageA = [stage, MyVariables.yourVariable]
            return stageA
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