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
        
        let request = NSFetchRequest(entityName: "cell")
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


}

