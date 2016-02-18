//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class ChoiceInterfaceController: WKInterfaceController {

    @IBOutlet var choiceTable: WKInterfaceTable!
    
    let choice = ["By Time", "By Stage"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        loadTableData()
        
    }
    
    private func loadTableData() {
        
        choiceTable.setNumberOfRows(choice.count, withRowType: "ChoiceTableRowController")
        
        for (index, choiceName) in choice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(choiceName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        let choiceName = choice[rowIndex]
        return choiceName
        
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