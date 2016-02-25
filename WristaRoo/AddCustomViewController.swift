//
//  AddCustomViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/24/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit

class AddCustomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var selectedIndexPaths = [NSIndexPath]()
    var newCustom = [String]()
    @IBOutlet weak var toPrint: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
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
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrayCustom.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayCustom[indexPath.item]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPaths.append(indexPath)
        newCustom.append(arrayCustom[indexPath.row])
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let index = selectedIndexPaths.indexOf(indexPath) {
            selectedIndexPaths.removeAtIndex(index)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setToolbarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setToolbarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addToCustom(sender: AnyObject) {
        performSegueWithIdentifier("addToCustom", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "addToCustom") {
            var svc = segue.destinationViewController as! ViewController;
            NSUserDefaults.standardUserDefaults().setObject(newCustom, forKey: "keyCustom")
            svc.toPass = newCustom
        }
    }
}

