//
//  EditCustomTableViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/25/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//

import UIKit

class EditCustomTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var toPass = []
    @IBOutlet weak var tableView: UITableView!
    var arrayNewCustom = []
    var clearA = []
    var tempANC: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabledata = NSUserDefaults.standardUserDefaults().arrayForKey("keyCustom")
        arrayNewCustom = tabledata as! [String]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
        self.tableView.setEditing(true, animated: true)
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return arrayNewCustom.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayNewCustom[indexPath.item] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            tempANC = arrayNewCustom.mutableCopy() as! NSMutableArray
            tempANC.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "saveCustom") {
            NSUserDefaults.standardUserDefaults().setObject(tempANC, forKey: "keyCustom")
        }
    }
}