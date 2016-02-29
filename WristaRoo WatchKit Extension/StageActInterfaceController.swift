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
    
    
    let stageThisTh = [
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act"
        ]
    let stageThatTh = [
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act"
        ]
    let stageOtherTh = [
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act"
        ]
    let stageDiscoTh = [
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act"
        ]
    let stageXmasTh = [
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
        "Time", "Act",
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
        
        if context[0] as! String == "This Tent" && context[1] as! String == "th"{
            thThis()
        }
        if context[0] as! String == "That Tent" && context[1] as! String == "th"{
            thThat()
        }
        if context[0] as! String == "The Other Tent" && context[1] as! String == "th"{
            thOther()
        }
        if context[0] as! String == "Silent Disco" && context[1] as! String == "th"{
            thDisco()
        }
        if context[0] as! String == "Christmas Barn" && context[1] as! String == "th"{
            thXmas()
        }
        
    }
    
    private func thThis() {
        
        stageActTable.setRowTypes(stageThisTh)
        for var rowIndex = 0; rowIndex < stageThisTh.count; rowIndex++ {
            switch stageThisTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actThisTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actThisTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    private func thThat() {
        
        stageActTable.setRowTypes(stageThatTh)
        for var rowIndex = 0; rowIndex < stageThatTh.count; rowIndex++ {
            switch stageThatTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actThatTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actThatTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    private func thOther() {
        
        stageActTable.setRowTypes(stageOtherTh)
        for var rowIndex = 0; rowIndex < stageOtherTh.count; rowIndex++ {
            switch stageOtherTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actOtherTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actOtherTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    private func thDisco() {
        
        stageActTable.setRowTypes(stageDiscoTh)
        for var rowIndex = 0; rowIndex < stageDiscoTh.count; rowIndex++ {
            switch stageDiscoTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actDiscoTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actDiscoTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    private func thXmas() {
        
        stageActTable.setRowTypes(stageXmasTh)
        for var rowIndex = 0; rowIndex < stageXmasTh.count; rowIndex++ {
            switch stageXmasTh[rowIndex] {
            case "Time":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! TimeStageActTableRowController
                row.timeLabel.setText(actXmasTh[rowIndex])
            case "Act":
                let row = stageActTable.rowControllerAtIndex(rowIndex) as! ActStageActTableRowController
                row.actLabel.setText(actXmasTh[rowIndex])
            default:
                print("nope")
            }
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "showByTimes" {
            let mainName = stageThisTh[rowIndex]
            return mainName
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