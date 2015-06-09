//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by qingjiezhao on 6/5/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    var frc = NSFetchedResultsController()
    
    var isAscending = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc.delegate = self
        
        frc = getFetchedResultsController()
        
        frc.performFetch(nil)
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getFetchedResultsController() -> NSFetchedResultsController{
        frc = NSFetchedResultsController(fetchRequest: listFetchRequest(), managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    func listFetchRequest() -> NSFetchRequest{
        let fetchRequest = NSFetchRequest(entityName: "List")
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
  

    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = frc.sections?.count
        return numberOfSections!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = frc.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        let list = frc.objectAtIndexPath(indexPath) as! List
        
        cell.textLabel?.text = list.name
        var note = list.note
        var qty = list.qty
        cell.detailTextLabel?.text = "Qty: \(qty) - \(note)."
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let managedObject = frc.objectAtIndexPath(indexPath) as! NSManagedObject
        context.deleteObject(managedObject)
        context.save(nil)
        
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let itemController = segue.destinationViewController as! DetailViewController
            let nItem = frc.objectAtIndexPath(indexPath!) as! List
            itemController.nItem = nItem
            
        }else if segue.identifier == "add" {
            
        }
    }
    
   
    
    //unwind
    @IBAction func close(segue:UIStoryboardSegue){
        print("close")
        //refreshUI()
    }
    
 
    
}

