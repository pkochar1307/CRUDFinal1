//
//  ViewController.swift
//  CRUDfinal
//
//  Created by Capgemini on 11/09/19.
//  Copyright © 2019 Capgemini. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func create(_ sender: Any) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let todoEntity = NSEntityDescription.entity(forEntityName: "Sensor" , in: managedObjectContext)!
        
        let todo = NSManagedObject(entity : todoEntity , insertInto : managedObjectContext)
        
        todo.setValue ("First Item" , forKey:"name")
        todo.setValue ("First Item Description" , forKey:"desc")
        todo.setValue (1, forKey:"id")
        
        do{
            try managedObjectContext.save()
        }catch let error as NSError{
            print("Could not save.\(error), \(error.userInfo)")
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

