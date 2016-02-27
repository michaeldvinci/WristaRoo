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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "By Stage" && context[1] as! String == "th"{
            loadThStage()
            MyVariables.yourVariable = "th"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "fr"{
            loadThStage()
            MyVariables.yourVariable = "fr"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "sa"{
            loadThStage()
            MyVariables.yourVariable = "sa"
        } else if context[0] as! String == "By Stage" && context[1] as! String == "su"{
            loadThStage()
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
        super.willActivate()
        NSLog("%@ will activate", self)
    }
    
    override func didDeactivate() {
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}