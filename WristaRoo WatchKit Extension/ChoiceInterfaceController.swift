//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//
//
//

import WatchKit
import Foundation
import WatchConnectivity

class ChoiceInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var cTimeTable: WKInterfaceTable!
    @IBOutlet var choiceTable: WKInterfaceTable!
    
    var custArray = [String]()
    var watchSession: WCSession!
    
    let choicesC : [String] = ["By Stage"]
    let choicesD : [String] = ["By Time"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "Thursday" && context[1] as! String == "full" {
            loadchoicesCs()
            MyVariables.yourVariable = "th"
        } else if context[0] as! String == "Friday" && context[1] as! String == "full" {
            loadchoicesCs()
            MyVariables.yourVariable = "fr"
        } else if context[0] as! String == "Saturday" && context[1] as! String == "full" {
            loadchoicesCs()
            MyVariables.yourVariable = "sa"
        } else if context[0] as! String == "Sunday" && context[1] as! String == "full" {
            loadchoicesCs()
            MyVariables.yourVariable = "su"
        } else if context[0] as! String == "Thursday" && context[1] as! String == "cust" {
            loadThCust()
            MyVariables.yourVariable = "th"
            
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
    
    
    private func loadThCust() {
        
        if let tabledata = NSUserDefaults.standardUserDefaults().arrayForKey("keyRoo") {
        
            if tabledata.count > 0 {
                self.choiceTable.setNumberOfRows(tabledata.count, withRowType: "ChoiceTableRowController")
            } else {
                self.choiceTable.setNumberOfRows(0, withRowType: "ChoiceTableRowController")
            }
        
            for (index, thName) in tabledata.enumerate() {
                let row2 = self.choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
                row2.choiceLabel.setText(thName as? String)
            }
        }
        
    }
    
    
    private func loadchoicesCs() {
        choiceTable.setNumberOfRows(choicesC.count, withRowType: "ChoiceTableRowController")
        for (index, thName) in choicesC.enumerate() {
            let row2 = choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            row2.choiceLabel.setText(thName)
        }
        cTimeTable.setNumberOfRows(choicesD.count, withRowType: "ChoiceTableRowController2")
        for (index, thName) in choicesD.enumerate() {
            let row2 = cTimeTable.rowControllerAtIndex(index) as! ChoiceTableRowController
            row2.choiceTime.setText(thName)
        }
        
    }
    
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showChoices" {
            if MyVariables.yourVariable == "th"{
                let dayA = [choicesC[rowIndex], MyVariables.yourVariable]
                return dayA
            }
            if MyVariables.yourVariable == "fr"{
                let dayA = [choicesC[rowIndex], MyVariables.yourVariable]
                return dayA
            }
            if MyVariables.yourVariable == "sa"{
                let dayA = [choicesC[rowIndex], MyVariables.yourVariable]
                return dayA
            }
            if MyVariables.yourVariable == "su"{
                let dayA = [choicesC[rowIndex], MyVariables.yourVariable]
                return dayA
            }
        }
        if segueIdentifier == "showByTime" && MyVariables.yourVariable == "th"{
            let dayName = choicesD[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showByTime" && MyVariables.yourVariable == "fr"{
            let dayName = choicesD[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showByTime" && MyVariables.yourVariable == "sa"{
            let dayName = choicesD[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showByTime" && MyVariables.yourVariable == "su"{
            let dayName = choicesD[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        
        return nil
        
    }
    
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}