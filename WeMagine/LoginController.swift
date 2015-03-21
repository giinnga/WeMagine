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
    
    var fbLoginView = FBLoginView()
    
    var loggedIn: Bool = false

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
        
        width = 173.0 * prop * 1.5
        height = 158.0 * prop * 1.5
        x = (sizeRect.size.width - width)/2
        y = ((sizeRect.size.height - (height + 160 + 50))/2)
        
        var logoImage: UIImage = UIImage(named: "NewLogo@3x.png")!
        var logoImageView: UIImageView = UIImageView(image: logoImage)
        //logoImageView.backgroundColor = UIColor.blackColor()
        logoImageView.frame = CGRectMake(x, y, width, height)

        self.view.addSubview(logoImageView)
       
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        fbLoginView.frame = CGRectMake((sizeRect.size.width - 200)/2, y + height + 160, 200, 50)
        self.view.addSubview(fbLoginView)
        
////        Text Fields
//        
//        width = verifyPosition(sizeRect.size.width/1.5)
//        height = verifyPosition(0.16 * sizeRect.size.width)
//        x = verifyPosition(sizeRect.size.width/2 - width/2)
//        y = verifyPosition(sizeRect.size.height/2.3)
//        
//        username.frame = CGRect(x: x, y: y, width: width, height: height)
//        username.backgroundColor = UIColor.whiteColor()
//        username.placeholder = "Username"
//        username.borderStyle = UITextBorderStyle.None
//        username.layer.cornerRadius = height/2
//        username.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        
//        self.view.addSubview(username)
//        
//        password.frame = CGRect(x: x, y: y + height + 10, width: width, height: height)
//        password.backgroundColor = UIColor.whiteColor()
//        password.placeholder = "Password"
//        password.borderStyle = UITextBorderStyle.None
//        password.layer.cornerRadius = height/2
//        password.secureTextEntry = true
//        password.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
//        
//        self.view.addSubview(password)
//        
////        Buttons
//        
//        var buttonImage: UIImage = UIImage(named: "LoginButton@3x.png")!
//        
//        var loginButtonImage: UIImageView = UIImageView(image: buttonImage)
//        loginButtonImage.frame = CGRect(x: sizeRect.size.width/5, y: sizeRect.size.height/1.45, width: 10, height: 10)
//        loginButtonImage.sizeToFit()
//        self.view.addSubview(loginButtonImage)
//        
//        var testButtonImage: UIImageView = UIImageView(image: buttonImage)
//        testButtonImage.frame = CGRect(x: 2.7 * sizeRect.size.width/5, y: sizeRect.size.height/1.45, width: 10, height: 10)
//        testButtonImage.sizeToFit()
//        testButtonImage.userInteractionEnabled = true
//        self.view.addSubview(testButtonImage)
//        
//        let test = UITapGestureRecognizer(target: self, action:Selector("test:"))
//        test.delegate = self
//        testButtonImage.addGestureRecognizer(test)
        
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        if(loggedIn == false) {
            //println("User Logged In")
        }
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        if(loggedIn == false) {
            checkUserCredentials(user)
            loggedIn = true
        }
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        //println("User Logged Out")
        loggedIn = false
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
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
                    
                    println("Some error has occurred!")
                    FBSession.activeSession().closeAndClearTokenInformation()
                    
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
                
                println("Some error has occurred!")
                FBSession.activeSession().closeAndClearTokenInformation()
            }
            
        })
        
        task.resume()
        
    }
    
    func logInApp(username: String, useremail: String)
    {
        let secondViewController:ViewController = ViewController()
        secondViewController.theUsername = username
        secondViewController.theUseremail = useremail
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
