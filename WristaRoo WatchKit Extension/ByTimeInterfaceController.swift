//
//  ByTimeInterfaceController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/18/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchKit

class ByTimeInterfaceController: WKInterfaceController {
    
    static let xmas = "Christmas Barn"
    static let other = "The Other Tent"
    static let this = "This Tent"
    static let that = "That Tent"
    static let disco = "Silent Disco"
    static let which = "Which Stage"
    static let what = "What Stage"
    var tempArray: [String] = []
    
    @IBOutlet var ByTimeTable: WKInterfaceTable!
    
    let types = ["Time", "Act", "Location"]
    
    let thTime = [
        "4:00 - 6:30", "Tiki Disco", xmas,
        "5:30 - 8:30", "Quickie Mart", disco,
        "5:45 - 6:30", "Unlocking the Truth", this,
        "6:00 - 6:45", "DMAs", other,
        "6:45 - 7:30", "Dej Loaf", that,
        "7:00 - 7:45", "Strand of Oaks", this,
        "7:00 - 8:00", "New Breed Brass Band", xmas,
        "7:15 - 8:00", "Ryan Weazver", other,
        "8:00 - 8:45", "Dopapod", that,
        "8:15 - 12:30", "Full Service Party", xmas,
        "8:15 - 9:00", "Iceage", this,
        "8:30 - 9:15", "Temples", other,
        "8:30 - 10:30", "The Unsheathed", disco,
        "9:15 - 10:00", "Houndmouth", that,
        "9:30 - 10:15", "The Growlers", this,
        "9:45 - 10:30", "Glass Animals", other,
        "10:30 - 11:30", "Tove Lo", that,
        "10:30 - 12:00", "Matoma", disco,
        "10:45 - 11:30", "courtney Barnett", this,
        "1100 - 11:45", "Benjamin Booker", other,
        "12:00 - 1:00", "Jungle", that,
        "12:00 - 2:00", "Quickie Mart", disco,
        "12:15 - 1:00", "Mac DeMarco", this,
        "12:15 - 1:15", "Gramatik", other,
        "1:00 - 2:00", "Snicklefritz", xmas,
        "2:30 - 6:00", "Tiki Disco", xmas
        ]
    
    let frTime = [
        "1:15 - 2:15", "The Districts", other,
        "2:00 - 3:00", "Brown Sabbath", which,
        "2:00 - 3:00", "Pallbearer", that,
        "2:00 - 4:45", "Full Service Party", xmas,
        "3:00 - 4:00", "King Gizzard", other,
        "3:15 - 4:15", "Tanya Tagaq", this,
        "3:30 - 4:30", "SOJA", what,
        "3:45 - 4:45", "Royal Blood", which,
        "3:45 - 4:45", "Between the Buried & Me", that,
        "4:30 - 6:30", "Motion Potion", disco,
        "5:00 - 6:00", "Against Me", this,
        "5:00 - 6:00", "New Breed Brass Band", xmas,
        "5:30 - 6:30", "Dawes", what,
        "5:30 - 6:30", "Moon Taxi", which,
        "5:30 - 6:30", "Rustie", that,
        "6:15 - 9:00", "Full Service Party", xmas,
        "6:30 - 7:30", "Sylvan Esso", other,
        "6:30 - 8:30", "Attom", disco,
        "6:45 - 7:45", "Guster", this,
        "7:15 - 8:30", "Kacey Musgraves", that,
        "7:15 - 8:15", "Atmosphere", which,
        "7:30 - 8:45", "Alabama Shakes", what,
        "8:15 - 9:30", "Ben Folds & yMusic", other,
        "8:30 - 9:45", "Tears for Fears", this,
        "9:15 - 10:30", "Ben Harper", which,
        "9:45 - 11:00", "Kendrick Lamar", this,
        "10:30 - 12:30", "Motion Picture", disco,
        "11:00 - 12:15", "MSMW", that,
        "11:00 - 1:00", "Full Service PArty", xmas,
        "11:15 - 12:15", "Run the Jewels", this,
        "11:30 - 12:45", "Earth, Wind & Fire", which,
        "12:00 - 1:30", "Deadmau5", what,
        "12:!5 - 1:45", "Flying Lotus", other,
        "12:30 - 2:00", "Matoma", disco,
        "1:00 - 2:15", "Odesza", this,
        "1:30 - 2:30", "Jon Cleary", xmas,
        "2:00 - 3:30", "STS9", that,
        "2:00 - 4:00", "DJ Prince Hakim", disco,
        "3:00 - 4:00", "Tiki Disco", xmas,
        "4:00 - 5:00", "Tropical Party", xmas,
        "5:00 - 6:00", "Tiki Disco", xmas
        ]
    
    let saTime = [
        "12:30 - 1:30", "Priory", this,
        "12:30 - 1:45", "Jon Cleary", that,
        "12:45 - 1:45", "So Percussion", other,
        "2:00 - 3:00", "Catfish & the Bottlemen", this,
        "2:00 - 5:00", "Full Service PArty", xmas,
        "2:15 - 3:15", "Songhoy Blues", which,
        "2:30 - 3:30", "Gregory Alan Isakov", that,
        "2:30 - 3:30", "Phox", other,
        "3:30 - 4:45", "Trampled by Turtles", what,
        "3:30 - 5:00", "E.Feld", disco,
        "3:45 - 4:45", "Woods", this,
        "4:00 - 5:00", "Rhiannon Giddens", which,
        "4:15 - 5:15", "SZA", other,
        "4:15 - 5:30", "Bahams", that,
        "5:00 - 6:00", "Nola Bounce Party", xmas,
        "5:00 - 7:00", "SnickleFritz", disco,
        "5:15 - 6:30", "Bleachers", this,
        "5:45 - 6:45", "The War on Drugs", which,
        "5:45 - 7:00", "Hozier", what,
        "6:00 - 7:30", "Jamie XX", other,
        "6:00 - 6:00", "Full Service Party", xmas,
        "6:15 - 7:30", "Sturgill Simpson", that,
        "7:00 - 8:15", "Belle & Sebastian", this,
        "7:00 - 10:00", "Tiki Disco", disco,
        "7:30 - 8:30", "Gary Clark Jr", which,
        "8:00 - 9:30", "SBTRKT", other,
        "8:00 - 10:00", "My Morning Jacket", what,
        "8:15 - 9:30", "Atomic Bomb", that,
        "9:15 - 10:30", "Childish Gambino", which,
        "10:00 - 1:00", "Mumford & Sons", what,
        "11:00 - 12:00", "DJ Logic", disco,
        "11:00 - 1:00", "Full Service PArty", xmas,
        "12:00 - 12:45", "Different Slep", disco,
        "12:00 - 1:15", "Slayer", this,
        "12:00 - 1:15", "Tycho", that,
        "12:45 - 1:30", " Nuri", disco,
        "1:00 - 2:15", "Bassnectar", which,
        "1:00 - 2:00", "Vogue Dance Off", xmas,
        "1:30 - 2:15", "Childish Major", disco,
        "1:30 - 3:00", "Superjam", other,
        "2:00 - 3:15", "Flume", that,
        "2:00 - 3:30", "D'Angelo", this,
        "2:15 - 3:00", "El Dusty", disco,
        "3:00 - 4:00", "Mike Gao", disco,
        "3:00 - 4:00", "Robe Rave", xmas,
        "4:00 - 6:00", " 90s Rave", xmas
        ]
    
    let suTime = [
        "12:15 - 1:15", "Pokey LaForge", which,
        "12:30 - 1:15", "Shakey Graves", that,
        "12:145 - 2:00", "Christopher Denny", this,
        "1:15 - 2:15", "Jessica Hernandez", other,
        "1:45 - 2:30", "Hurray for Riff Raff", that,
        "2:00 - 3:00", "Madisen Ward", which,
        "2:30 - 3:45", "Twenty One Pilots", what,
        "2:30 - 3:45", "His Golden Messenger", this,
        "2:45 - 3:45", "Shabazz Palaces", other,
        "3:00 - 4:00", "Bela Fleck", that,
        "3:45 - 5:00", "Awolnation", which,
        "4:00 - 5:00", "Full Service Party", xmas,
        "4:15 - 5:15", "MO", other,
        "4:15 - 5:15", "The Very Best", this,
        "4:45 - 5:45", "Jerry Douglas", that,
        "4:45 - 6:00", "Spoon", what,
        "5:00 - 6:00", "Hip Hop Party", xmas,
        "5:00 - 8:00", "DJ Logic", disco,
        "5:45 - 6:45", "Freddie Gibbs & Madlib", other,
        "5:45 - 7:00", "Brandi Carlile", which,
        "6:00 - 7:00", "Regge Party", xmas,
        "6:00 - 7:15", "Rudimental", this,
        "6:30 - 7:30", "Punch Brothers", that,
        "7:00 - 8:00", "Florence & the MAchine", what,
        "7:00 - 9:00", "Full Service Party", xmas,
        "7:30 - 8:45", "Caribou", other,
        "7:45 - 9:00", "Robert Plant", which,
        "8:00 - 9:00", "G-Eazy", this,
        "8:00 - 9:00", "Bluegrass Superjam", that,
        "9:00 - 11:30", "Billy Joel", what
        ]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        guard let context = context as? [AnyObject] else {
            return
        }
        
        print(context[1])
        
        if context[0] as! String == "By Time" {
            MyVariables.yourVariable = context[1] as! String
            if context[1] as! String == "th" {
                timeTable(thTime)
            }
            if context[1] as! String == "fr" {
                timeTable(frTime)
            }
            if context[1] as! String == "sa" {
                timeTable(saTime)
            }
            if context[1] as! String == "su" {
                timeTable(suTime)
            }
        }
        
    }
    
    struct MyVariables {
        static var yourVariable = "someString"
    }
    
    private func timeTable(typesA: [String]) {
        var tempA: [String] = createTypesArray(typesA)
        ByTimeTable.setRowTypes(tempA)
        for rowIndex in 0 ..< typesA.count {
            switch tempA[rowIndex] {
            case "Time":
                let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! TimeTableRowController
                row.timeLabel.setText(typesA[rowIndex])
            case "Act":
                let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! ActTableRowController
                row.actLabel.setText(typesA[rowIndex])
            case "Location":
                let row = ByTimeTable.rowControllerAtIndex(rowIndex) as! LocationTableRowController
                row.locationLabel.setTextColor(UIColor.blackColor())
                if typesA[rowIndex] == "Silent Disco" {
                    row.LocationGroup.setBackgroundImageNamed("disco")
                }
                else if typesA[rowIndex] == "Christmas Barn" {
                    row.LocationGroup.setBackgroundImageNamed("xmas")
                }
                else if typesA[rowIndex] == "The Other Tent" {
                    row.LocationGroup.setBackgroundImageNamed("other")
                }
                else if typesA[rowIndex] == "This Tent" {
                    row.LocationGroup.setBackgroundImageNamed("this")
                }
                else if typesA[rowIndex] == "That Tent" {
                    row.LocationGroup.setBackgroundImageNamed("that")
                }
                else if typesA[rowIndex] == "Which Stage" {
                    row.LocationGroup.setBackgroundImageNamed("which")
                }
                else if typesA[rowIndex] == "What Stage" {
                    row.LocationGroup.setBackgroundImageNamed("what")
                }
                row.locationLabel.setText(typesA[rowIndex])
            default:
                print("nope")
            }
        }
    }

    private func createTypesArray (typesA: [String]) -> [String] {
        for index in 0 ..< typesA.count {
            tempArray.append(types[index % 3])
        }
        return tempArray
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        
        if segueIdentifier == "timeToStage" {
            if MyVariables.yourVariable == "th" {
                let stageA = [thTime[rowIndex], MyVariables.yourVariable]
                return stageA
            }
            if MyVariables.yourVariable == "fr"{
                let stageA = [frTime[rowIndex], MyVariables.yourVariable]
                return stageA
            }
            if MyVariables.yourVariable == "sa"{
                let stageA = [saTime[rowIndex], MyVariables.yourVariable]
                return stageA
            }
            if MyVariables.yourVariable == "su"{
                let stageA = [suTime[rowIndex], MyVariables.yourVariable]
                return stageA
            }

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
    
    //timeToStage

    
}