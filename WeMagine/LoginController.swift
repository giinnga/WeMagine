//
//  LoginController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/17/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UIGestureRecognizerDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    var username: UITextField = UITextField()
    var password: UITextField = UITextField()

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
        
//        Logo
        
        var logoImage: UIImage = UIImage(named: "Logo@3x.png")!
        var logoImageView: UIImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: sizeRect.size.width/2 - (0.46133 * sizeRect.size.width)/2, y: 0.12 * sizeRect.size.height, width: 100, height: 100)
        logoImageView.sizeToFit()
        self.view.addSubview(logoImageView)
        
//        Text Fields
        
        username.frame = CGRect(x: sizeRect.size.width/2 - sizeRect.size.width/3, y: sizeRect.size.height/2.3, width: sizeRect.size.width/1.5, height: 60)
        username.backgroundColor = UIColor.whiteColor()
        username.placeholder = "Username"
        username.borderStyle = UITextBorderStyle.None
        username.layer.cornerRadius = 30
        username.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        self.view.addSubview(username)
        
        password.frame = CGRect(x: sizeRect.size.width/6, y: sizeRect.size.height/1.8, width: sizeRect.size.width/1.5, height: 60)
        password.backgroundColor = UIColor.whiteColor()
        password.placeholder = "Password"
        password.borderStyle = UITextBorderStyle.None
        password.layer.cornerRadius = 30
        password.secureTextEntry = true
        password.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        self.view.addSubview(password)
        
//        Buttons
        
        var buttonImage: UIImage = UIImage(named: "LoginButton@3x.png")!
        
        var loginButtonImage: UIImageView = UIImageView(image: buttonImage)
        loginButtonImage.frame = CGRect(x: sizeRect.size.width/5, y: sizeRect.size.height/1.45, width: 10, height: 10)
        loginButtonImage.sizeToFit()
        self.view.addSubview(loginButtonImage)
        
        var testButtonImage: UIImageView = UIImageView(image: buttonImage)
        testButtonImage.frame = CGRect(x: 2.7 * sizeRect.size.width/5, y: sizeRect.size.height/1.45, width: 10, height: 10)
        testButtonImage.sizeToFit()
        testButtonImage.userInteractionEnabled = true
        self.view.addSubview(testButtonImage)
        
        let test = UITapGestureRecognizer(target: self, action:Selector("test:"))
        test.delegate = self
        testButtonImage.addGestureRecognizer(test)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(recognizer: UITapGestureRecognizer)
    {
        performSegueWithIdentifier("teste", sender: self)
    }
    
    override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
        
        if identifier == "teste"
        {
            let secondViewController:ViewController = ViewController()
            self.dismissViewControllerAnimated(false, completion: {})
            self.presentViewController(secondViewController, animated: true, completion: nil)
        }
        
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
