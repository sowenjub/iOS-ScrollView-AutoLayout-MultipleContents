//
//  ViewWithTableController.swift
//  AutoLayoutScrollViewMultipleSubviews
//
//  Created by Arnaud Joubay on 02/12/2014.
//  Copyright (c) 2014 Happy Team Labs. All rights reserved.
//

import UIKit

class ViewWithTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableRows: Array<String> = ["Hello", "How are you", "Fine", "Thanks"]
    
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        self.tableHeightConstraint.constant = 44 * CGFloat(tableRows.count)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell") as UITableViewCell
        
        cell.textLabel.text = tableRows[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let insertAt = NSIndexPath(forRow: tableRows.count, inSection: 0)
        tableRows.append("More dummy text")
        tableView.beginUpdates()
        tableView.insertRowsAtIndexPaths([insertAt], withRowAnimation: .Right)
        tableView.endUpdates()
        self.tableHeightConstraint.constant = 44 * CGFloat(tableRows.count)
    }
}
