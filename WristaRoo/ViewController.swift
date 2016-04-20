//
//  ViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/17/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var toPass = []
    var watchSession: WCSession?
    var arrayNewCustom = []
    var clearA = []
    var tempANC: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = false

    }
    
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
            editButton.title = "Edit"
            self.tableView.setEditing(false, animated: true)
        } else {
            editButton.title = "Done"
            self.tableView.setEditing(true, animated: true)
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
}

