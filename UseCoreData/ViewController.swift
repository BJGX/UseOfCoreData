//
//  ViewController.swift
//  UseCoreData
//
//  Created by tembin on 2017/5/4.
//  Copyright © 2017年 YQ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  
  var context: NSManagedObjectContext?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  @IBAction func add(_ sender: Any) {
    let app = UIApplication.shared.delegate as! AppDelegate
    let contexts = app.persistentContainer.viewContext
    
    let entityName = "Person"
    let onePerson = NSEntityDescription.insertNewObject(forEntityName: entityName, into: contexts) as! Person
    
    onePerson.name = "nnn"
    onePerson.uid = "111"
    onePerson.url = "2333"
    app.saveContext()
    
  }
  
  @IBAction func shan(_ sender: Any) {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    let contexts = app.persistentContainer.viewContext
    let entityName = "Person"
    
    let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
    fetchRequest.fetchLimit = 10
    fetchRequest.fetchOffset = 0
    
    let entity = NSEntityDescription.entity(forEntityName: entityName, in: contexts)
    fetchRequest.entity = entity
    
    let predicate = NSPredicate.init(format: "name = 'nnn'", "")
    fetchRequest.predicate = predicate
    
    
    do {
      
      let fetchedObjects = try contexts.fetch(fetchRequest) as! [Person]
      for one: Person in fetchedObjects {
        contexts.delete(one)
        app.saveContext()
      }
      
    } catch  {
      let nserror = error as NSError
      fatalError("查询错误： \(nserror), \(nserror.userInfo)")
      
    }

  }

  
  // 改
  @IBAction func gai(_ sender: Any) {
    
    
    let app = UIApplication.shared.delegate as! AppDelegate
    let contexts = app.persistentContainer.viewContext
    let entityName = "Person"
    
    let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
    fetchRequest.fetchLimit = 10
    fetchRequest.fetchOffset = 0
    
    let entity = NSEntityDescription.entity(forEntityName: entityName, in: contexts)
    fetchRequest.entity = entity
    
    let predicate = NSPredicate.init(format: "name = 'nnn'", "")
    fetchRequest.predicate = predicate
    
    
    do {
      
      let fetchedObjects = try contexts.fetch(fetchRequest) as! [Person]
      print(fetchedObjects)
      for one in fetchedObjects {
        
        one.uid = "123"
        app.saveContext()
      }
      
    } catch  {
      let nserror = error as NSError
      fatalError("查询错误： \(nserror), \(nserror.userInfo)")
      
    }

    
    
  }

  @IBAction func cha(_ sender: Any) {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    let contexts = app.persistentContainer.viewContext
    let entityName = "Person"
    
    let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
    fetchRequest.fetchLimit = 10
    fetchRequest.fetchOffset = 0
    
    let entity = NSEntityDescription.entity(forEntityName: entityName, in: contexts)
    fetchRequest.entity = entity
    
    let predicate = NSPredicate.init(format: "name = 'nnn'", "")
    fetchRequest.predicate = predicate
    
    do {
      
      let fetchedObjects = try contexts.fetch(fetchRequest) as! [Person]
      for one: Person in fetchedObjects {
        print("==========\(String(describing: one.name))")
        print("==========\(String(describing: one.uid))")
        print("==========\(String(describing: one.url))")
      }
      
    } catch  {
      let nserror = error as NSError
      fatalError("查询错误： \(nserror), \(nserror.userInfo)")
      
    }
    
  }
}

