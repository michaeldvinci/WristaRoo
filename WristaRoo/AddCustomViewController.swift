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
    var clearA = [String]()
    @IBOutlet weak var toPrint: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var buttonC: UIBarButtonItem!
    @IBOutlet weak var buttonA: UIBarButtonItem!
            
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
        "Flux Capacitor",
        "Lael Neale",
        "Mail the Horse",
        "FKJ",
        "Joseph",
        "Doe Paoro",
        "Wet",
        "Hinds",
        "Full Service Party",
        "Bryson Tiller",
        "Bob Moses",
        "Amanda Shires",
        "Arkells",
        "Holy White Hound",
        "Luke Bell",
        "Whitney",
        "Andrew Combs",
        "Mothers",
        "Powers",
        "Public Access TV",
        "Henry Wagons",
        "Firekid",
        "Lane 8",
        "Tiki Disco",
        "Amasa Hines",
        "Aubrie Sellers",
        "Cardiknox",
        "Dylan LeBlanc",
        "Grace Mitchell",
        "Grandma Sprrow",
        "Promised Land Sound",
        "Issac Gracie",
        "Joe Fertler & the Rainbow Seekers",
        "Lawrence",
        "The Record Company",
        "Sir the BaptistMArgaret Glaspy",
        "NSR",
        "Red Bull Music Academy",
        "Maren Morris",
        "Sun Club",
        "Sunflower Bean",
        "Finish Ticket",
        "Dawn",
        "Korey Dane",
        "Polly A.",
        "Swim Deep",
        "Austin Plaine"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabledata = NSUserDefaults.standardUserDefaults().arrayForKey("keyCustom")
        if tabledata?.count > 0 {
            newCustom = tabledata as! [String]
        }
        
        self.toolbar.setBackgroundImage(UIImage(),
                                        forToolbarPosition: UIBarPosition.Any,
                                        barMetrics: UIBarMetrics.Default)
        self.toolbar.setShadowImage(UIImage(),
                                    forToolbarPosition: UIBarPosition.Any)
        self.buttonA.tintColor=colorWithHexString("#ffffff")
        self.buttonC.tintColor=colorWithHexString("#ffffff")
        
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
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = arrayCustom[indexPath.item]
        cell.textLabel?.textAlignment = .Center
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPaths.append(indexPath)
        if !newCustom.contains(arrayCustom[indexPath.row]) {
            newCustom.append(arrayCustom[indexPath.row])
        }
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = colorWithHexString("#802499")
        selectedCell.textLabel?.textColor = colorWithHexString("#00c411")
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let index = selectedIndexPaths.indexOf(indexPath) {
            selectedIndexPaths.removeAtIndex(index)
        }
        
        let cellToDeSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cellToDeSelect.contentView.backgroundColor = colorWithHexString("#8b2ea4") //983bb0
        cellToDeSelect.textLabel?.textColor = colorWithHexString("#FFFFFF")
        
    }
    @IBAction func clearList(sender: AnyObject) {
        newCustom = clearA
        NSUserDefaults.standardUserDefaults().setObject(newCustom, forKey: "keyCustom")
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
            let svc = segue.destinationViewController as! ViewController;
            NSUserDefaults.standardUserDefaults().setObject(newCustom, forKey: "keyCustom")
            svc.toPass = newCustom
        }
    }
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}

