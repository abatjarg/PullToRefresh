//
//  RefreshTableViewController.swift
//  PullToRefresh
//
//  Created by Ariunjargal on 2/28/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit

class RefreshTableViewController: UITableViewController {
    
    var refreshLoadingView : UIView!
    var falcon : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Refresh 
    
    func setupRefreshControl() {
        
        // Initialize the refresh control
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.tintColor = UIColor.clearColor()
        
        // Initialize the background view
        self.refreshLoadingView = UIView(frame: self.refreshControl!.bounds)
        self.refreshLoadingView.backgroundColor = UIColor.blackColor()
        
        // Initialize the falcon image view
        
        //Set the ship left of the layout out of view
        //self.falcon = UIImageView(frame: CGRectMake(-20, (self.refreshControl?.bounds.height)! / 2.0 - 7, 20, 15))
        
        //Set the ship in the middle of the view
        self.falcon = UIImageView(frame: CGRectMake((self.refreshControl?.bounds.width)! / 2.0 - 25, (self.refreshControl?.bounds.height)! / 2.0 - 25, 60, 50))
        self.falcon.image = UIImage(named: "falcon.png")
        self.falcon.alpha = 0
        
        // Add image view to the background view
        self.refreshLoadingView.addSubview(self.falcon)
        self.refreshLoadingView.clipsToBounds = true
        
        // Add background view to refresh control
        self.refreshControl?.addSubview(self.refreshLoadingView)
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
    }
    
    func refresh(){
        let endTime = dispatch_time(DISPATCH_TIME_NOW, Int64(5.0 * Double(NSEC_PER_SEC)));
        dispatch_after(endTime, dispatch_get_main_queue()) { () -> Void in
            self.refreshControl!.endRefreshing()
        }
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.animateRefreshView()
    }
    
    func animateRefreshView() {
        
// Animation to move the ship, commented out at the moment due to some issue in animation
//
//        UIView.animateWithDuration(
//            Double(1),
//            delay: Double(2),
//            options: UIViewAnimationOptions.CurveEaseOut,
//            animations: {
//                var falconFrame = self.falcon.frame
//                falconFrame.origin.x = (self.refreshControl?.bounds.width)! / 2.0 - 20
//                self.falcon.frame = falconFrame
//                //self.falcon.transform = CGAffineTransformMakeScale(2, 2)
//            },
//            completion: { finished in
//                UIView.animateWithDuration(
//                    Double(1),
//                    delay: Double(3),
//                    options: UIViewAnimationOptions.CurveEaseIn,
//                    animations: {
//                        var falconFrame = self.falcon.frame
//                        falconFrame.origin.x = (self.refreshControl?.bounds.width)! + 20
//                        self.falcon.frame = falconFrame
//                        //self.falcon.transform = CGAffineTransformMakeScale(1,1)
//                    },
//                    completion: { finished in
//                        
//                    }
//                )
//            }
//        )
        
        // Fade in animation
        
        UIView.animateWithDuration(
            Double(1),
            delay: Double(1),
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.falcon.alpha = 1.0
            },
            completion: { finished in
                UIView.animateWithDuration(
                    Double(0.3),
                    delay: Double(2),
                    options: UIViewAnimationOptions.CurveEaseOut,
                    animations: {
                        self.falcon.alpha = 0
                    },
                    completion: { finished in
                        
                    }
                )
            }
        )
        
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
