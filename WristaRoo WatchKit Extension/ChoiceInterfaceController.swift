//
//  InterfaceController.swift
//  AppleRoo WatchKit Extension
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class ChoiceInterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet var choiceTable: WKInterfaceTable!
    @IBOutlet var cTimeTable: WKInterfaceTable!
    
    var custArray = [String]()
    var watchSession: WCSession!
    
    static let choicesC : [String] = ["By Stage"]
    static let choicesD : [String] = ["By Time"]
    
    let thChoice = choicesC
    let thTime = choicesD
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "Thursday" && context[1] as! String == "full" {
            loadThChoices()
            MyVariables.yourVariable = "th"
        } else if context[0] as! String == "Friday" && context[1] as! String == "full" {
            loadThChoices()
            MyVariables.yourVariable = "fr"
        } else if context[0] as! String == "Saturday" && context[1] as! String == "full" {
            loadThChoices()
            MyVariables.yourVariable = "sa"
        } else if context[0] as! String == "Sunday" && context[1] as! String == "full" {
            loadThChoices()
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
    
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject?
    {
        
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "th"{
            let dayName = thChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "fr"{
            let dayName = thChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "sa"{
            let dayName = thChoice[rowIndex]
            let dayA = [dayName, MyVariables.yourVariable]
            return dayA
        }
        if segueIdentifier == "showChoices" && MyVariables.yourVariable == "su"{
            let dayName = thChoice[rowIndex]
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
        super.willActivate()
    }
    
    override func didDeactivate() {
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}