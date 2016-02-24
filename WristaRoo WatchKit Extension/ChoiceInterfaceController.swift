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
    
    @IBOutlet var cTimeTable: WKInterfaceTable!
    
    let appGroupID = "group.conedmiro.wristaroo"
    
    static let choicesC : [String] = ["By Stage"]
    static let choicesD : [String] = ["By Time"]
    
    let thChoice = choicesC
    let frChoice = choicesC
    let saChoice = choicesC
    let suChoice = choicesC
    
    let thTime = choicesD
    let frTime = choicesD
    let saTime = choicesD
    let suTime = choicesD
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "Thursday" && context[1] as! String == "full" {
            loadThChoices()
            MyVariables.yourVariable = "th"
        } else if context[0] as! String == "Friday" && context[1] as! String == "full" {
            loadFrChoices()
            MyVariables.yourVariable = "fr"
        } else if context[0] as! String == "Saturday" && context[1] as! String == "full" {
            loadSaChoices()
            MyVariables.yourVariable = "sa"
        } else if context[0] as! String == "Sunday" && context[1] as! String == "full" {
            loadSuChoices()
            MyVariables.yourVariable = "su"
        } else if context[0] as! String == "Thursday" && context[1] as! String == "cust" {
        
            loadThCustChoices()
            
            MyVariables.yourVariable = "th"
            
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
    
    private func loadThCustChoices() {
        
        
        if let testArray : AnyObject? = NSUserDefaults(suiteName: appGroupID)!.objectForKey("arrayCustom") {
            let phoneArray : [NSString] = testArray! as! [NSString]
        
        
        //let defaults = NSUserDefaults(suiteName: appGroupID)
        //let phoneArray = NSUserDefaults.standardUserDefaults().objectForKey("arrayCustom") as! [String]

        choiceTable.setNumberOfRows(phoneArray.count, withRowType: "ChoiceTableRowController")
        
        for (index, thName) in phoneArray.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(thName as String)
        }
            
        }
        
        cTimeTable.setNumberOfRows(thTime.count, withRowType: "ChoiceTableRowController2")
        
        for (index, thName) in thTime.enumerate() {
            
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceTime.setText(thName)
        }
    }
    
    private func loadThChoices() {
        
        choiceTable.setNumberOfRows(thChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, thName) in thChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(thName)
        }
        
        cTimeTable.setNumberOfRows(thTime.count, withRowType: "ChoiceTableRowController2")
        
        for (index, thName) in thTime.enumerate() {
            
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceTime.setText(thName)
        }

        
    }
    
    private func loadFrChoices() {
        
        choiceTable.setNumberOfRows(frChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, frName) in frChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(frName)
        }
        
        cTimeTable.setNumberOfRows(frTime.count, withRowType: "ChoiceTableRowController2")
        
        for (index, thName) in frTime.enumerate() {
            
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceTime.setText(thName)
        }
        
    }
    
    private func loadSaChoices() {
        
        choiceTable.setNumberOfRows(saChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, saName) in saChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(saName)
        }
        
        cTimeTable.setNumberOfRows(saTime.count, withRowType: "ChoiceTableRowController2")
        
        for (index, thName) in saTime.enumerate() {
            
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceTime.setText(thName)
        }
        
    }
    
    private func loadSuChoices() {
        
        choiceTable.setNumberOfRows(suChoice.count, withRowType: "ChoiceTableRowController")
        
        for (index, suName) in suChoice.enumerate() {
            
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceLabel.setText(suName)
        }
        
        cTimeTable.setNumberOfRows(suTime.count, withRowType: "ChoiceTableRowController2")
        
        for (index, thName) in suTime.enumerate() {
            
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            
            row2.choiceTime.setText(thName)
        }
        
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "th"{
            let dayName = thChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "fr"{
            let dayName = frChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "sa"{
            let dayName = saChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "su"{
            let dayName = suChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showByTime" && MyVariables.yourVariable == "th"{
            let dayName = thTime[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
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