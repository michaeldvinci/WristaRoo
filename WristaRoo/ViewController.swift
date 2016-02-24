//
//  ViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    
    var watchSession: WCSession?
    var arrayCustom = [
        "Pearl Jam",
        "Dead & Co.",
        "LCD Soundsystem",
        "J. Cole",
        "Ellie Goulding",
        "Macklemore",
        "Tame Impala",
        "Death Cab for Cutie",
        "M83",
        "HAIM",
        "Halsey",
        "Ween",
        "Jason Isbell",
        "CHVRCHES",
        "Miguel",
        "Chris Stapleson",
        "Judd Apatow & Friends",
        "The Chainsmokers",
        "Superjam",
        "Big Grams",
        "Band of Horses",
        "Leon Bridges",
        "Grace Potter",
        "Father John Misty",
        "Adam Devine",
        "Purity Ring",
        "The Claypool Lennon Delirium",
        "Two Door Cinema Club",
        "Sam Hunt",
        "Flosstradaumus",
        "Zeds Dead",
        "Adventure Club",
        "Tyler The Creator",
        "Bridget Everett",
        "Griz",
        "Mavis Staples",
        "TouchPants",
        "Kurt Vile & the Violators",
        "Blood Orange",
        "Lord Huron",
        "RL Grime",
        "The Bluegrass Situation",
        "X Ambassadors",
        "St. Lucia",
        "Piff the Magic Dragon",
        "Lucius",
        "Vince Staples",
        "Third eye Blind",
        "Cymande",
        "Misterwives",
        "Clutch",
        "Goldlink",
        "Lettuce",
        "Cashmere Cat",
        "Goddamn Comedy Jam",
        "Fidlar",
        "Ibeyi",
        "Keys N Krates",
        "Sam Bush Band",
        "The Wood Brothers",
        "Saint Motel",
        "Daughter",
        "The FLoozies",
        "Marian Hill",
        "Kamasi Washington",
        "BØRNS",
        "Post Malone",
        "Shamir",
        "Allen Stone",
        "Brett Dennen",
        "Oh Wonder",
        "Boy & the Bear",
        "Dungen",
        "Judah & the Lion",
        "Steve Gunn",
        "Steep Canyon Rangers",
        "The Oh Hellos",
        "The Internet",
        "John Moreland",
        "Andra Day",
        "Anderson East",
        "Twin Peaks",
        "Bully",
        "Natalie Prass",
        "Chicano Batman",
        "Givers",
        "Hermitude",
        "Jarryd James",
        "Lizzo",
        "Papadosio",
        "Rayland Baxter",
        "Vulfpeck",
        "Sata Watkins",
        "The Knocks",
        "Waxahatchee",
        "Beach Fossils",
        "Whilk and Misky",
        "Hundred Waters",
        "The London Souls",
        "Lolawolf",
        "Civil Twilight",
        "Roman Gianarthur",
        "Lany",
        "Con Brio",
        "Flux Capacitor"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(WCSession.isSupported()) {
            watchSession = WCSession.defaultSession()
            watchSession?.delegate = self
            watchSession?.activateSession()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sendCustArray(sender: AnyObject) {
        sendToWatch()
    }
    
    private func sendToWatch() {
        do {
            let applicationDict = ["Array1": arrayCustom]
            try WCSession.defaultSession().updateApplicationContext(applicationDict)
        }
            
        catch {
            print(error)
        }
    }
}

