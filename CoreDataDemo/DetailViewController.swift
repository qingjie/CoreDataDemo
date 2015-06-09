//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by qingjiezhao on 6/5/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var nItem : List? = nil
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if nItem != nil{
            name.text = nItem?.name
            note.text = nItem?.note
            quantity.text = nItem?.qty
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(sender: AnyObject) {
        if nItem != nil{
            editItem()
        }else{
            newItem()
        }
    }


    func newItem(){
        let context = self.context
        let ent = NSEntityDescription.entityForName("List", inManagedObjectContext: context!)
        
        let nItem = List(entity:ent! , insertIntoManagedObjectContext: context)
        
        nItem.name = name.text
        nItem.note = note.text
        nItem.qty = quantity.text
        context?.save(nil)
    }
    
    
    func editItem(){
        nItem!.name = name.text
        nItem!.note = note.text
        nItem!.qty = quantity.text
        context?.save(nil)
        
    }

}
