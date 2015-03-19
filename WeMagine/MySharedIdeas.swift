//
//  MySharedIdeas.swift
//  WeMagine
//
//  Created by Victor Souza on 3/15/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class MySharedIdeas: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    var number = 11
    var module = 2
    
    var goodVotesArray = [Int]()
    var badVotesArray = [Int]()
    var ideasArray = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        var topHeight:CGFloat = 44.0
        
        goodVotesArray.append(1)
        goodVotesArray.append(2)
        goodVotesArray.append(3)
        
        badVotesArray.append(1)
        badVotesArray.append(2)
        badVotesArray.append(3)
        
        ideasArray.append("Ideia 1")
        ideasArray.append("Ideia 2")
        ideasArray.append("Ideia 3")
        
//        Top Bar
        
        width = (375.0 * prop) + 2
        height = (topHeight + barHeight) + 2
        x = -1
        y = -1
        
        var topMenuRectangle:UIView = UIView(frame: CGRectMake(x, y, width, height))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        topMenuRectangle.layer.zPosition = 10
        topMenuRectangle.layer.borderWidth = 0.5
        topMenuRectangle.layer.borderColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0).CGColor
        self.view.addSubview(topMenuRectangle)
        
        width = 63.0
        height = 44.0
        x = self.sizeRect.width - width
        y = barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        lampIconView.userInteractionEnabled = true
        lampIconView.layer.zPosition = 11
        self.view.addSubview(lampIconView)
        
        let newIdea = UITapGestureRecognizer(target: self, action:Selector("newIdea:"))
        newIdea.delegate = self
        lampIconView.addGestureRecognizer(newIdea)
        
        fontSize = verifyPosition(0.0580 * sizeRect.size.width) - 1
        
        x = (sizeRect.size.width-300)/2
        y = barHeight;
        
        let weMagineLabel = UILabel(frame: CGRectMake(x, y,300,topHeight))
        weMagineLabel.font = UIFont(name: "HelveticaNeue", size: fontSize)
        weMagineLabel.textAlignment = .Center
        weMagineLabel.text = "We magine!"
        weMagineLabel.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        weMagineLabel.layer.zPosition = 11
        self.view.addSubview(weMagineLabel)
        
//        Table View
        
        var tableViewApp: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight + topHeight, width: sizeRect.size.width, height: sizeRect.size.height - (topHeight)))
        
        tableViewApp.delegate = self
        tableViewApp.dataSource = self
        
        tableViewApp.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        
        tableViewApp.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViewApp.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "blueCell")
        tableViewApp.registerNib(UINib(nibName: "BigCloud", bundle: nil), forCellReuseIdentifier: "bigCloud")
        
        self.view.addSubview(tableViewApp)
    }
    
    func verifyPosition(measure:CGFloat) -> CGFloat
    {
        var divisionRest = measure % 1
        var correctValue = measure + 1 - divisionRest
        return correctValue
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        
        let secondViewController:ViewController = ViewController()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideasArray.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("bigCloud", forIndexPath: indexPath) as BigCloud
            cell.backgroundColor = UIColor(red: 0.6275, green: 0.9216, blue: 1.0, alpha: 1.0)
            cell.editing = false
            
            return cell
        }
        
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("blueCell", forIndexPath: indexPath) as CustomCell
        
            if indexPath.row%2 == 0
            {
                if module == 2
                {
                    cell.backgroundColor = UIColor(red: 0.6265, green: 0.9197, blue: 1.0, alpha: 1.0)
                }
                else
                {
                    cell.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
                }
            }
            
            else
            {
                if module == 2
                {
                    cell.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
                }
                else
                {
                    cell.backgroundColor = UIColor(red: 0.6265, green: 0.9197, blue: 1.0, alpha: 1.0)
                }
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            cell.badVotesNumber.text = String(self.badVotesArray[indexPath.row-1])
            cell.goodVotesLabel.text = String(self.goodVotesArray[indexPath.row-1])
            cell.theIdea.text = self.ideasArray[indexPath.row-1]
            cell.theIdea.textAlignment = .Center
            
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
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row > 0
        {
            return true
        }
        return false
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row > 0
        {
            if editingStyle == UITableViewCellEditingStyle.Delete
            {
                
    //            var delete = tableView.cellForRowAtIndexPath(indexPath)!.tag
                ideasArray.removeAtIndex(indexPath.row-1)
                badVotesArray.removeAtIndex(indexPath.row-1)
                goodVotesArray.removeAtIndex(indexPath.row-1)
                if module == 2
                {
                    module = 1
                }
                else
                {
                    module = 2
                }
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
            }
        }
    }

}
