//
//  MySharedIdeas.swift
//  WeMagine
//
//  Created by Victor Souza on 3/15/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class MySharedIdeas: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        
//        Table View
        
        var tableViewApp: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: sizeRect.size.width, height: sizeRect.size.height))
        
        tableViewApp.delegate = self
        tableViewApp.dataSource = self
        
        tableViewApp.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViewApp.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "blueCell")
        tableViewApp.registerNib(UINib(nibName: "BigCloud", bundle: nil), forCellReuseIdentifier: "bigCloud")
        
        self.view.addSubview(tableViewApp)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("bigCloud", forIndexPath: indexPath) as BigCloud
            
            return cell
        }
        
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("blueCell", forIndexPath: indexPath) as CustomCell
        
            if indexPath.row%2 == 0
            {
                cell.backgroundColor = UIColor(red: 0.6265, green: 0.9197, blue: 1.0, alpha: 1.0)
            }
            
            else
            {
                cell.backgroundColor = UIColor(red: 0.9608, green: 0.9608, blue: 0.9608, alpha: 1.0)
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            return 206
        }
        
        return 103
    }

}
