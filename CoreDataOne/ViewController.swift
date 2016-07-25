//
//  ViewController.swift
//  CoreDataOne
//
//  Created by wealthyjalloh on 25/07/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var results: NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        // INSERT 
        let celldata = NSEntityDescription.insertNewObjectForEntityForName("cell", inManagedObjectContext: context)
        celldata.setValue("Yoda Tux", forKey: "title")
        celldata.setValue("Science Fiction", forKey: "subtitle")
        celldata.setValue("yodaTux.png", forKey: "image")
        
        do {
            try context.save()
        } catch {
            print("Error!")
        }
        
        let request = NSFetchRequest(entityName: "Cell")
        request.returnsObjectsAsFaults = false
        results = try? context.executeFetchRequest(request)
        
        if (results!.count>0) {
            for res in results! {
                print(res)
            }
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        let aux = results![indexPath.row] as! NSManagedObject
        
        cell.textLabel!.text = aux.valueForKey("title") as? String
        cell.detailTextLabel?.text = aux.valueForKey("subtitle") as? String
        cell.imageView!.image = UIImage(named: aux.valueForKey("image") as! String)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TuxMania"
    }


}

