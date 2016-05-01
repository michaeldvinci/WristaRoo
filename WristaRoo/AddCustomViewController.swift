//
//  AddCustomViewController.swift
//  WristaRoo
//
//  Created by Michael Vinci on 2/24/16.
//  Copyright © 2016 Michael Vinci. All rights reserved.
//
        
import UIKit
import RealmSwift
        
class AddCustomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let realm = try! Realm()
    var selectedIndexPaths = [NSIndexPath]()
    var newCustom = [String]()
    var clearA = [String]()
    @IBOutlet weak var toPrint: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var buttonC: UIBarButtonItem!
    @IBOutlet weak var buttonA: UIBarButtonItem!
    
    var selectedRows = [NSMutableIndexSet]()
        
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
        self.buttonA.tintColor=colorWithHexString("#00c411")
        self.buttonC.tintColor=colorWithHexString("#00c411")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.tableView.allowsMultipleSelection = true
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        let acts = realm.objects(Act).filter("custom = 0")
        
        return acts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let acts = realm.objects(Act).filter("custom = 0")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = acts[indexPath.item]["actName"] as? String
        cell.textLabel?.textAlignment = .Center
        
        return cell
        
        //  limeGreen   00c411
        //  lightPurp   8b2ea4
        //  darkPurp    371555
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPaths.append(indexPath)
        
        let acts = realm.objects(Act)
        
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = colorWithHexString("#802499")
        selectedCell.textLabel?.textColor = colorWithHexString("#00c411")
        
        try! realm.write {
            acts.filter("actName == %@", (selectedCell.textLabel?.text)!).setValue(1, forKey: "custom")
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let index = selectedIndexPaths.indexOf(indexPath) {
            selectedIndexPaths.removeAtIndex(index)
        }
        
        let acts = realm.objects(Act)
        
        let cellToDeSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cellToDeSelect.contentView.backgroundColor = colorWithHexString("#8b2ea4") //983bb0
        cellToDeSelect.textLabel?.textColor = colorWithHexString("#FFFFFF")
        
        try! realm.write {
            acts.filter("actName == %@", (cellToDeSelect.textLabel?.text)!).setValue(0, forKey: "custom")
        }
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
            
            selectedRows = [NSMutableIndexSet]()
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

