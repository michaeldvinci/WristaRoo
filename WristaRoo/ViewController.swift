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
    
    var toPass = ["", ""]
    var watchSession: WCSession?
    var arrayNewCustom = ["", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayNewCustom = toPass
        
        if(WCSession.isSupported()) {
            watchSession = WCSession.defaultSession()
            watchSession?.delegate = self
            watchSession?.activateSession()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrayNewCustom.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayNewCustom[indexPath.item]
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
        
        performSegueWithIdentifier("toEdit", sender: sender)
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

