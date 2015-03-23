//
//  LoginController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/17/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UIGestureRecognizerDelegate, FBLoginViewDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    var username: UITextField = UITextField()
    var password: UITextField = UITextField()
    
    var rotation = CGFloat()
    
    var deleteView = UIImageView()
    var loadSprite = UIImageView()
    
    var fbLoginView = FBLoginView()
    
    var loggedIn: Bool = false
    
    var theLang = "pt-br"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        var topHeight:CGFloat = (44.0*prop)
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        
//      Logo
        
        var space:CGFloat = 30.0
        var middle:CGFloat = 60.0
        
        width = 134.0 * prop * 1.5
        height = 150.0 * prop * 1.5
        x = (sizeRect.size.width - width)/2
        y = ((sizeRect.size.height - (height + space + middle + 50))/2)
        
        var logoImage: UIImage = UIImage(named: "NewLogo@3x.png")!
        var logoImageView: UIImageView = UIImageView(image: logoImage)
        //logoImageView.backgroundColor = UIColor.blackColor()
        logoImageView.frame = CGRectMake(x, y, width, height)

        self.view.addSubview(logoImageView)
        
        var buttonView = UILabel()
        buttonView.frame = CGRectMake((sizeRect.size.width - 200)/2, y + height + space + middle, 200, 40)
        buttonView.backgroundColor = UIColor.whiteColor()
        buttonView.layer.cornerRadius = 4
        buttonView.layer.masksToBounds = true
        buttonView.text = LanguagesManager.textLoginEnterNoLoginButton(theLang)
        buttonView.textAlignment = .Center
        buttonView.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        buttonView.userInteractionEnabled = true
        self.view.addSubview(buttonView)
        
        let logGesture = UITapGestureRecognizer(target: self, action:Selector("enterNoLog"))
        logGesture.delegate = self
        buttonView.addGestureRecognizer(logGesture)
       
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        fbLoginView.frame = CGRectMake((sizeRect.size.width - 200)/2, y + height + space, 200, 50)
        fbLoginView.layer.shadowRadius = 0
        fbLoginView.layer.shadowOpacity = 0
        self.view.addSubview(fbLoginView)
        
//      Delete View
        
        deleteView.frame = CGRectMake(0, 0, sizeRect.size.width, sizeRect.size.height + barHeight)
        deleteView.backgroundColor = UIColor.blackColor()
        deleteView.alpha = 0
        deleteView.layer.zPosition = 99
        
        self.view.addSubview(deleteView)
        
//      Loading Sprite
        
        width = 74.0 * prop * 1.3
        height = 74.0 * prop * 1.3
        x = (sizeRect.size.width - width)/2
        y = (sizeRect.size.height - height)/2
        
        var loadImage: UIImage = UIImage(named: "LoadCloud@3x.png")!
        loadSprite = UIImageView(image: loadImage)
        loadSprite.frame = CGRectMake(x,y,width,height)
        loadSprite.alpha = 0
        loadSprite.layer.zPosition = 100
        self.view.addSubview(loadSprite)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("animateLoadIcon"), userInfo: nil, repeats: true)
        
    }
    
    func animateLoadIcon() {
        
        rotation += 0.1
        if (rotation >= CGFloat(M_PI*2)) {
            rotation = rotation - CGFloat(M_PI*2)
        }
        loadSprite.transform = CGAffineTransformMakeRotation(rotation)
        
    }
    
    func enterNoLog() {
        
        let secondViewController:ViewController = ViewController()
        secondViewController.loggedIn = false
        secondViewController.theLang = self.theLang
        self.presentViewController(secondViewController, animated: true, completion: nil)
        
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        if(loggedIn == false) {
            
            self.view.userInteractionEnabled = false
            UIView.animateWithDuration(0.3, animations: {
                self.deleteView.alpha = 0.6
                self.loadSprite.alpha = 1
            }, completion: {
                (value: Bool) in
                
            })
        }
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        if(loggedIn == false) {
            checkUserCredentials(user)
            loggedIn = true
        }
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        
        loggedIn = false
        
        UIView.animateWithDuration(0.3, animations: {
            self.deleteView.alpha = 0
            self.loadSprite.alpha = 0
        }, completion: {
            (value: Bool) in
            self.view.userInteractionEnabled = true
        })
        
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
        loginError()

    }
    
    func loginError() {
        
        UIView.animateWithDuration(0.3, animations: {
            self.deleteView.alpha = 0
            self.loadSprite.alpha = 0
            }, completion: {
                (value: Bool) in
                self.view.userInteractionEnabled = true
                var alert = UIAlertView(title: "Oops!", message: LanguagesManager.textLoginCouldNotConnectFacebook(self.theLang), delegate: self, cancelButtonTitle: "OK")
                alert.show()
                FBSession.activeSession().closeAndClearTokenInformation()
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkUserCredentials(user: FBGraphUser) {
        
//        println("User: \(user)")
//        println("User ID: \(user.objectID)")
//        println("User Name: \(user.name)")
//        var userEmail = user.objectForKey("email") as String
//        println("User Email: \(userEmail)")
        
        var userEmail = user.objectForKey("email") as String
        
        let escapedName = user.name.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let escapedEmail = userEmail.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        let urlpath = "http://104.131.156.49/wemagine/getUser.php?email="+escapedEmail+"&name="+escapedName
        
        var url = NSURL(string: urlpath)
        var session = NSURLSession.sharedSession()
        let task : NSURLSessionDataTask = session.dataTaskWithURL(url!, completionHandler: {(data, response, error) in
            
            if let theData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                
                if(theData["Status"] as String == "cannotCreateUser") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        println("Some error has occurred!")
                        self.loginError()
                    }
                    
                } else if(theData["Status"] as String == "userFound") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        var result = theData["Result"] as NSArray
                        var dic = result[0] as NSDictionary
                        
                        //println(dic["Name"] as String)
                        self.logInApp(dic["Name"] as String, useremail: dic["Email"] as String)
                    }
                    
                } else if(theData["Status"] as String == "userCreated") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        //println(user.name)
                        self.logInApp(user.name, useremail: userEmail)
                    }
                    
                }
                
            } else {
                
                dispatch_async(dispatch_get_main_queue()) {
                    () -> Void in
                    
                    println("Some error has occurred!")
                    //self.loginError()
                }
            }
            
        })
        
        task.resume()
        
    }
    
    func logInApp(username: String, useremail: String)
    {
        let secondViewController:ViewController = ViewController()
        secondViewController.theUsername = username
        secondViewController.theUseremail = useremail
        secondViewController.loggedIn = true
        secondViewController.theLang = self.theLang
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    func verifyPosition(measure:CGFloat) -> CGFloat
    {
        var divisionRest = measure % 1
        var correctValue = measure + 1 - divisionRest
        return correctValue
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
