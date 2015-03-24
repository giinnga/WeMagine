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
    
    var loadSprite = UIImageView()
    var deleteView = UIImageView()
    var cryCloud = UIImageView()
    
    var cryText = UILabel()
    
    var rotation:CGFloat = 0.0
    
    var number = 11
    var module = 2
    
    var theLang = String()
    
    var datatask = NSURLSessionDataTask()
    
    var tableViewApp = UITableView()
    
    var useremail = String()
    
    var userIdeas:NSMutableArray = NSMutableArray()
    
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
        
        width = 84.0
        height = 44.0
        x = -1
        y = -1 + barHeight
        
        var lampIcon:UIImage = UIImage(named: LanguagesManager.imageBackButton(self.theLang))!
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
        
//      Table View
        
        tableViewApp = UITableView(frame: CGRect(x: 0, y: barHeight + topHeight, width: sizeRect.size.width, height: sizeRect.size.height - (topHeight)))
        
        tableViewApp.delegate = self
        tableViewApp.dataSource = self
        
        tableViewApp.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        
        tableViewApp.separatorStyle = UITableViewCellSeparatorStyle.None
        tableViewApp.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "blueCell")
        tableViewApp.registerNib(UINib(nibName: "BigCloud", bundle: nil), forCellReuseIdentifier: "bigCloud")
        
        self.view.addSubview(tableViewApp)
        
//      Can't find ideas
        
        width = 325.0 * prop * 0.3
        height = 274.9 * prop * 0.3
        x = (sizeRect.size.width - width)/2
        y = 206.0 + 120
        
        var cryImage = UIImage(named: "CryingCloud@2x.png")
        cryCloud.image = cryImage
        cryCloud.frame = CGRectMake(x, y, width, height)
        cryCloud.alpha = 0
        
        self.view.addSubview(cryCloud)
        
        cryText.frame = CGRectMake((sizeRect.size.width - 250)/2, y + height - 25, 250, 100)
        cryText.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        cryText.text = LanguagesManager.textMyIdeasNoIdeas(self.theLang)
        cryText.lineBreakMode = .ByWordWrapping
        cryText.numberOfLines = 10
        cryText.textAlignment = .Center
        cryText.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        cryText.alpha = 0
        
        self.view.addSubview(cryText)
        
//      Delete View
        
        deleteView.frame = CGRectMake(0, 0, sizeRect.size.width, sizeRect.size.height + barHeight)
        deleteView.backgroundColor = UIColor.blackColor()
        deleteView.alpha = 0
        deleteView.hidden = true
        deleteView.layer.zPosition = 99
        
        self.view.addSubview(deleteView)
        
//      Loading Sprite
        
        width = 74.0 * prop * 1.3
        height = 74.0 * prop * 1.3
        x = (sizeRect.size.width - width)/2
        y = 206.0 + 80.0 + topHeight + barHeight
        
        var loadImage: UIImage = UIImage(named: "LoadCloud@3x.png")!
        loadSprite = UIImageView(image: loadImage)
        loadSprite.frame = CGRectMake(x,y,width,height)
        loadSprite.alpha = 1
        loadSprite.layer.zPosition = 100
        self.view.addSubview(loadSprite)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("animateLoadIcon"), userInfo: nil, repeats: true)
        
        loadIdeas()
    }
    
    func animateLoadIcon() {
        
        rotation += 0.1
        if (rotation >= CGFloat(M_PI*2)) {
            rotation = rotation - CGFloat(M_PI*2)
        }
        loadSprite.transform = CGAffineTransformMakeRotation(rotation)
        
    }
    
    func loadIdeas() {
        
        let escapedEmail = useremail.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        let emailFinal = escapedEmail.stringByReplacingOccurrencesOfString("&", withString: "%26", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        let urlpath = "http://104.131.156.49/wemagine/getUserIdeas.php?email="+emailFinal
        
        var url = NSURL(string: urlpath)
        var session = NSURLSession.sharedSession()
        datatask = session.dataTaskWithURL(url!, completionHandler: {(data, response, error) in
            
            if let theData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                
                if(theData["Status"] as String == "sucsessfullyLoadedIdeas") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        var result = theData["Result"] as NSMutableArray
                        self.userIdeas = result
                        
                        UIView.animateWithDuration(0.5, animations: {
                            
                            self.loadSprite.alpha = 0
                            
                        }, completion: {
                                
                            (value: Bool) in
                            
                            self.tableViewApp.reloadData()
                            
                        })
                        
                    }
                    
                } else if(theData["Status"] as String == "userEmptyIdeas") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        UIView.animateWithDuration(0.5, animations: {
                            
                            self.loadSprite.alpha = 0
                            
                        }, completion: {
                                
                            (value: Bool) in
                            self.noIdeas()

                        })

                    }
                    
                }
                
            } else {
                
                println("Some error has occurred!")
                dispatch_async(dispatch_get_main_queue()) {
                    () -> Void in
                    self.loadIdeas()
                }
                
                
            }
            
        })
        
        datatask.resume()
        
    }
    
    func noIdeas() {
        UIView.animateWithDuration(0.5, animations: {
            
            self.cryCloud.alpha = 1
            self.cryText.alpha = 1
                
        })
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
        return userIdeas.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("bigCloud", forIndexPath: indexPath) as BigCloud
            cell.backgroundColor = UIColor(red: 0.6275, green: 0.9216, blue: 1.0, alpha: 1.0)
            cell.editing = false
            cell.selectionStyle = .None
            cell.bigCloudText.text = LanguagesManager.textMyIdeasBigCloudText(self.theLang)
            
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
            
            cell.badVotesNumber.text = self.userIdeas[indexPath.row-1]["Dislikes"] as? String
            cell.goodVotesLabel.text = self.userIdeas[indexPath.row-1]["Likes"] as? String
            cell.theIdea.text = self.userIdeas[indexPath.row-1]["Text"] as? String
            
            var tf: UITextView = cell.theIdea as UITextView
            var size: CGSize = tf.sizeThatFits(CGSize(width: 160, height: 103))
            var topCorrectFade = (cell.theIdea.bounds.height - size.height * cell.theIdea.zoomScale)/2
            topCorrectFade = (topCorrectFade < 0.0 ? 0.0 : topCorrectFade)
            
            cell.badVotesNumber.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
            cell.goodVotesLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
            cell.theIdea.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
            cell.theIdea.textAlignment = .Center
            
            if cell.alinhado == false
            {
                cell.theIdea.layer.sublayerTransform = CATransform3DMakeTranslation(0, verifyPosition(topCorrectFade) - 1, 0)
                cell.alinhado = true
            }
            
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
                self.view.userInteractionEnabled = false
                self.deleteView.hidden = false
                UIView.animateWithDuration(0.5, animations: {
                    
                    self.loadSprite.alpha = 1
                    self.deleteView.alpha = 0.6
                
                }, completion: {
                    
                    (value: Bool) in
                    
                    let escapedID = self.userIdeas[indexPath.row-1]["Id"] as String
                    
                    let urlpath = "http://104.131.156.49/wemagine/removeIdea.php?id="+escapedID
                    
                    var url = NSURL(string: urlpath)
                    var session = NSURLSession.sharedSession()
                    var task = session.dataTaskWithURL(url!, completionHandler: {(data, response, error) in
                        
                        if let theData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                            
                            if(theData["Status"] as String == "ideaDeletedSucessfully") {
                                
                                dispatch_async(dispatch_get_main_queue()) {
                                    () -> Void in
                                    
                                    self.userIdeas.removeObjectAtIndex(indexPath.row-1)
                                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
                                    
                                    UIView.animateWithDuration(1, animations: {
                                        
                                        self.loadSprite.alpha = 0
                                        self.deleteView.alpha = 0
                                        
                                    }, completion: {
                                        (value: Bool) in
                                        self.deleteView.hidden = true
                                        self.view.userInteractionEnabled = true
                                        tableView.reloadData()
                                        if(self.userIdeas.count <= 0) {
                                            self.noIdeas()
                                        }
                                    })
                                }
                                
                            } else if(theData["Status"] as String == "anErrorOcurred") {
                                
                                dispatch_async(dispatch_get_main_queue()) {
                                    () -> Void in
                                    println("Some error has occurred!")
                                    
                                    var alert = UIAlertView(title: "Oops!", message: "Something went wrong!\nPlease try again!", delegate: self, cancelButtonTitle: "OK")
                                    alert.show()
    
                                    UIView.animateWithDuration(0.5, animations: {
                                        
                                        self.loadSprite.alpha = 0
                                        self.deleteView.alpha = 0
                                        
                                        }, completion: {
                                            (value: Bool) in
                                            self.deleteView.hidden = true
                                            self.view.userInteractionEnabled = true
                                    })
                                }
                                
                            }
                            
                        } else {
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                () -> Void in
                                println("Some error has occurred!")
                                
                                var alert = UIAlertView(title: "Oops!", message: "Something went wrong!\nPlease try again!", delegate: self, cancelButtonTitle: "OK")
                                alert.show()

                                UIView.animateWithDuration(0.5, animations: {
                                    
                                    self.loadSprite.alpha = 0
                                    self.deleteView.alpha = 0
                                    
                                    }, completion: {
                                        (value: Bool) in
                                        self.deleteView.hidden = true
                                        self.view.userInteractionEnabled = true
                                })
                            }
                            
                        }
                        
                    })
                    
                    task.resume()
                        
                })
                
            }
        }
    }
}
