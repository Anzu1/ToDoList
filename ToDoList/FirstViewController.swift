//
//  FirstViewController.swift
//  ToDoList
//
//  Created by appcamp on 7/19/15.
//  Copyright (c) 2015 appcamp. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items = [Item]()
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CellId")
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.name
        cell.detailTextLabel!.text = item.details
        
        return cell
    }
    
    func fetchData() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let manageContext = appDelegate.managedObjectContext!

        let fetchRequest = NSFetchRequest(entityName: "Item")
        
        var error: NSError?
        
        let fetchResults = manageContext.executeFetchRequest(fetchRequest, error: &error) as? [Item]
        
        if let results = fetchResults {
            items = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        itemsTableView.reloadData()
    }
    
    //usuwanie
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            itemsMgr.deleteItem(items[indexPath.row])
            fetchData()
        }
        
    }
}

