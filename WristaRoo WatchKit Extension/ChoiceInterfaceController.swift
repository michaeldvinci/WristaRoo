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
    
    let thChoice = ["By Time    Th", "By Stage    Th"]
    let frChoice = ["By Time    Fr", "By Stage    Fr"]
    let saChoice = ["By Time    Sa", "By Stage    Sa"]
    let suChoice = ["By Time    Su", "By Stage    Su"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? String else {
            return
        }
        
        if context == "Thursday" {
            loadThChoices()
            MyVariables.yourVariable = "thurs"
        } else if context == "Friday" {
            loadFrChoices()
            MyVariables.yourVariable = "fri"
        } else if context == "Saturday" {
            loadSaChoices()
            MyVariables.yourVariable = "sat"
        } else if context == "Sunday" {
            loadSuChoices()
            MyVariables.yourVariable = "sun"
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
    
    private func loadThChoices() {
        
        choiceTable.setNumberOfRows(thChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, thName) in thChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(thName)
        }
        
    }
    
    private func loadFrChoices() {
        
        choiceTable.setNumberOfRows(frChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, frName) in frChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(frName)
        }
        
    }
    
    private func loadSaChoices() {
        
        choiceTable.setNumberOfRows(saChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, saName) in saChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(saName)
        }
        
    }
    
    private func loadSuChoices() {
        
        choiceTable.setNumberOfRows(suChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, suName) in suChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(suName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "thurs"{
            let dayName = thChoice[rowIndex]
            return dayName
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "fri"{
            let dayName = frChoice[rowIndex]
            return dayName
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "sat"{
            let dayName = saChoice[rowIndex]
            return dayName
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "sun"{
            let dayName = suChoice[rowIndex]
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