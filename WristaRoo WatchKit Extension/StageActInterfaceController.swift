//
//  StageActInterfaceController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/18/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class StageActInterfaceController: WKInterfaceController {
    
    @IBOutlet var stageActTable: WKInterfaceTable!
    var tempArray: [String] = []
    var tempA: [String] = []
    var dayStage: [String] = []
    
    let byTimeA = [
        "Time", "Act"
    ]
    
    let actThisTh = [
        "5:45 - 6:30", "Unlocking the Truth",
        "7:00 - 7:45", "Strand of Oaks",
        "8:15 - 9:00", "Iceage",
        "9:30 - 10:15", "The Growlers",
        "10:45 - 11:30", "Courtney Barnett",
        "12:15 - 1:00", "Mac DeMarco"
        ]
    let actThatTh = [
        "6:45 - 7:30", "Dej Loaf",
        "8:00 - 8:45", "Dopapod",
        "9:15 - 10:00", "Houndmouth",
        "10:30 - 11:30", "Tove Lo",
        "12:00 - 1:00", "Jungle"
        ]
    let actOtherTh = [
        "6:00 - 6:45", "DMAs",
        "7:15 - 8:00", "Ryan Weaver",
        "8:30 - 9:15", "Temples",
        "9:45 - 10:30", "Glass Animals",
        "11:00 - 11:45", "Benjamin Booker",
        "12:15 - 1:15", "Gramatik"
        ]
    let actDiscoTh = [
        "5:30 - 8:30", "Quickie Mart",
        "8:30 - 10:30", "The Unsheathed",
        "10:30 - 12:00", "Matoma",
        "12:00 - 2:00", "Quickie Mart"
        ]
    let actXmasTh = [
        "4:00 - 6:30", "Tiki Disco",
        "7:00 - 8:00", "New Breed Brass Band",
        "8:15 - 12:30", "Full Service Party",
        "1:00 - 2:00", "Snicklefritz",
        "2:30 - 6:00", "Tiki Disco"
        ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
       
        guard let context = context as? [AnyObject] else {
            return
        }
        
        if context[0] as! String == "This Tent" {
            This(context[1] as! String)
        }
        if context[0] as! String == "That Tent" {
            That(context[1] as! String)
        }
        if context[0] as! String == "The Other Tent" {
            Other(context[1] as! String)
        }
        if context[0] as! String == "Silent Disco" {
            Disco(context[1] as! String)
        }
        if context[0] as! String == "Christmas Barn" {
            Xmas(context[1] as! String)
        }
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
    
    //
    // ACTUAL WORKING CODE
    // This(  , actThisThurs )
    //
    
    private func This(dayA: String) {
        
        if dayA == "th" {
            dayStage = actThisTh
        }
        if dayA == "fr" {
            dayStage = actThisTh
        }
        if dayA == "sa" {
            dayStage = actThisTh
        }
        if dayA == "su" {
            dayStage = actThisTh
        }
        
        timeTable(dayStage)
    }
    
    private func That(dayA: String) {
        
        if dayA == "th" {
            dayStage = actThatTh
        }
        if dayA == "fr" {
            dayStage = actThatTh
        }
        if dayA == "sa" {
            dayStage = actThatTh
        }
        if dayA == "su" {
            dayStage = actThatTh
        }
        
        timeTable(dayStage)
    }
    
    private func Which(dayA: String) {
        
        if dayA == "fr" {
            dayStage = actOtherTh
        }
        if dayA == "sa" {
            dayStage = actOtherTh
        }
        if dayA == "su" {
            dayStage = actOtherTh
        }
        
        timeTable(dayStage)
    }
    
    private func What(dayA: String) {
        
        if dayA == "fr" {
            dayStage = actThisTh
        }
        if dayA == "sa" {
            dayStage = actThisTh
        }
        if dayA == "su" {
            dayStage = actThisTh
        }
        
        timeTable(dayStage)
    }
    
    private func Other(dayA: String) {
        
        if dayA == "th" {
            dayStage = actOtherTh
        }
        if dayA == "fr" {
            dayStage = actDiscoTh
        }
        if dayA == "sa" {
            dayStage = actDiscoTh
        }
        if dayA == "su" {
            dayStage = actDiscoTh
        }
        
        timeTable(dayStage)
    }
    
    private func Disco(dayA: String) {
        
        if dayA == "th" {
            dayStage = actDiscoTh
        }
        if dayA == "fr" {
            dayStage = actThisTh
        }
        if dayA == "sa" {
            dayStage = actThisTh
        }
        if dayA == "su" {
            dayStage = actThisTh
        }
        
        timeTable(dayStage)
    }
    
    private func Xmas(dayA: String) {
        
        if dayA == "th" {
            dayStage = actXmasTh
        }
        if dayA == "fr" {
            dayStage = actThisTh
        }
        if dayA == "sa" {
            dayStage = actThisTh
        }
        if dayA == "su" {
            dayStage = actThisTh
        }
        
        timeTable(dayStage)
    }
    
    //
    // BELOW THIS LINE IS CODE - ;p;
    //
    
    private func timeTable(stage: [String]) {
        tempA = createTimeArray(stage)
        stageActTable.setRowTypes(tempA)
        for var rowIndex = 0; rowIndex < tempA.count; rowIndex++ {
            switch tempA[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(stage[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(stage[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    private func createTimeArray (dayStage: [String]) -> [String] {
        for var rowIndex = 0; rowIndex < dayStage.count; rowIndex++ {
            tempArray.append(byTimeA[rowIndex % 2])
        }
        return tempArray
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {

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