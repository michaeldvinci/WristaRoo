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
        
        if (WCSession.isSupported()) {
            watchSession = WCSession.defaultSession()
            watchSession.delegate = self;
            watchSession.activateSession()
            print(" ")
            print("CONNECTED!2")
            print("CONNECTED!2")
            print("CONNECTED!2")
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
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            if let retrievedArray1 = applicationContext["Array1"] as? [String] {
                self.custArray = retrievedArray1
                print(" ")
                print("----------")
                print(" ")
                print(self.custArray)
                print(" ")
                print("++++++++++")
                print(" ")
            }
            self.choiceTable.setNumberOfRows(self.custArray.count, withRowType: "ChoiceTableRowController")
            for (index, thName) in self.custArray.enumerate() {
                let row2 = self.choiceTable.rowControllerAtIndex(index) as! ChoiceTableRowController
                row2.choiceLabel.setText(thName)
            }
        }
    }
    
}