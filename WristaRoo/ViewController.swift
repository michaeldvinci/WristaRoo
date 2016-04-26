//
//  ViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit
import WatchConnectivity
import Alamofire
import Foundation
import Realm
import SwiftCSV

class ViewController: UIViewController, WCSessionDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
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
            "http://wristaroo.com/schedule/wristaroo.csv",
            destination: { (temporaryURL, response) in
                let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
                let pathComponent = response.suggestedFilename
                
                localPath = directoryURL.URLByAppendingPathComponent(pathComponent!)
                
                return localPath!
                //
        })
            .response { (request, response, _, error) in
                print(response)
                print("Downloaded file to \(localPath!)")
                
                /**
                do {
                    print("test")
                    let csv =  try CSV(url: localPath!)
                    print(csv.header)
                } catch {
                    print("test2")
                }
 **/
        }
        
        print (localPath)
        
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
        return arrayNewCustom.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = arrayNewCustom[indexPath.item] as? String
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tempANC = arrayNewCustom.mutableCopy() as! NSMutableArray
            tempANC.removeObjectAtIndex(indexPath.row)
            arrayNewCustom = tempANC
            NSUserDefaults.standardUserDefaults().setObject(arrayNewCustom, forKey: "keyCustom")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
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

