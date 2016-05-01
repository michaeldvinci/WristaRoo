//
//  ViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import WatchConnectivity
import UIKit 
import Alamofire
import Foundation
import RealmSwift
import SwiftCSV

class ViewController: UIViewController, WCSessionDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var toPass = []
    var watchSession: WCSession?
    var arrayNewCustom = []
    var clearA = []
    @IBOutlet weak var toolbar: UIToolbar!
    var tempANC: NSMutableArray = []
    
    @IBOutlet weak var buttonC: UIBarButtonItem!
    @IBOutlet weak var buttonE: UIBarButtonItem!
    @IBOutlet weak var buttonA: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var localPath: NSURL?
        Alamofire.download(.GET,
            "http://wristaroo.com/schedule/default.realm",
            destination: { (temporaryURL, response) in
                
                /**
                let uiRealm = try! Realm()
                
                do {
                    let csv = try CSV(url: temporaryURL, encoding:NSASCIIStringEncoding)
                    
                    print(csv.header)
                    print(csv.rows[0]["actID"])
                    print(csv.rows[1]["actID"])
                    //csv.columns["stageOrder"]![0] = Int(csv.columns["stageOrder"]![0])
                    
                    //csv.columns[0][0] = Int(csv.columns[0][0])
                    
                    for i in 0 ... (csv.rows.count - 1) {
                        try! uiRealm.write { () -> Void in
                            let actID = Int(csv.rows[i]["actID"]!)! as Int
                            let actName = String(UTF8String: csv.rows[i]["actName"]!)! as String
                            let stage = String(UTF8String: csv.rows[i]["stage"]!)! as String
                            let day = String(UTF8String: csv.rows[i]["day"]!)! as String
                            let dayOrder = Int(csv.rows[i]["dayOrder"]!)! as Int
                            let stageOrder = Int(csv.rows[i]["stageOrder"]!)! as Int
                            let timeDisplay = String(UTF8String: csv.rows[i]["timeDisplay"]!)! as String
                            let custom = Int(csv.rows[i]["custom"]!)! as Int
                            
                            uiRealm.add(Act(value: [actID, actName, stage, day, dayOrder, stageOrder, timeDisplay, custom]))
                            print("Act Added")
                        }
                     }
                    
                    csv.enumerateAsArray({ (array) in
                        //print(array.first)
                    })
                } catch {
                    print("error outside")
                }
                **/
                
                let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
                let pathComponent = response.suggestedFilename
                
                localPath = directoryURL.URLByAppendingPathComponent(pathComponent!)
                
                return localPath!
                
        })
            .response { (request, response, _, error) in
                print(response)
            }
        
        arrayNewCustom = toPass
        if let tabledata = NSUserDefaults.standardUserDefaults().arrayForKey("keyCustom") {
            arrayNewCustom = tabledata as! [String]
        } else {
            arrayNewCustom = [""]
        }
        
        if(WCSession.isSupported()) {
            watchSession = WCSession.defaultSession()
            watchSession?.delegate = self
            watchSession?.activateSession()
        }
        
        self.toolbar.setBackgroundImage(UIImage(),
                                        forToolbarPosition: UIBarPosition.Any,
                                        barMetrics: UIBarMetrics.Default)
        self.toolbar.setShadowImage(UIImage(),
                                    forToolbarPosition: UIBarPosition.Any)
        
        self.buttonA.tintColor=colorWithHexString("#00c411")
        self.buttonE.tintColor=colorWithHexString("#00c411")
        self.buttonC.tintColor=colorWithHexString("#00c411")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = false

    }
    
    //  limeGreen   00c411
    //  lightPurp   8b2ea4
    //  darkPurp    371555
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        let acts = realm.objects(Act).filter("custom = 1")
        
        return acts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let acts = realm.objects(Act).filter("custom = 1")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = acts[indexPath.item]["actName"] as? String
        cell.textLabel?.textAlignment = .Center
        return cell
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
    
    @IBAction func sendCustArray(sender: AnyObject) {
        sendToWatch()
    }
    
    @IBAction func toEdit(sender: AnyObject) {
        if (self.tableView.editing) {
            buttonE.title = "Edit"
            self.tableView.setEditing(false, animated: false)
        } else {
            buttonE.title = "Done"
            self.tableView.setEditing(true, animated: false)
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    @IBAction func toClear(sender: AnyObject) {
        arrayNewCustom = []
        NSUserDefaults.standardUserDefaults().setObject(arrayNewCustom, forKey: "keyCustom")
        tableView.reloadData()
        do {
            let applicationDict = ["Array1": arrayNewCustom]
            try WCSession.defaultSession().updateApplicationContext(applicationDict)
        }
            
        catch {
            print(error)
        }
    }
    
    @IBAction func clearA(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(clearA, forKey: "keyCustom")
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
    
    private func sendToWatch() {
        do {
            let applicationDict = ["Array1": arrayNewCustom]
            try WCSession.defaultSession().updateApplicationContext(applicationDict)
        }
            
        catch {
            print(error)
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let acts = realm.objects(Act)
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if editingStyle == .Delete {
            try! realm.write {
                acts.filter("actName == %@", (selectedCell.textLabel?.text)!).setValue(0, forKey: "custom")
            }
            
            tableView.reloadData()
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

