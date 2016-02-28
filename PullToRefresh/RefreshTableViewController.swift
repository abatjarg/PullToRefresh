//
//  RefreshTableViewController.swift
//  PullToRefresh
//
//  Created by Ariunjargal on 2/28/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit

class RefreshTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Refresh 
    
    func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.backgroundColor = UIColor.grayColor()
        self.refreshControl?.tintColor = UIColor.whiteColor()
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        return cell
    }

}
