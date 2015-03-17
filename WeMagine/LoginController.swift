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
        
        width = 0.540625 * sizeRect.size.width
        height = 0.48753 * sizeRect.size.width
        x = sizeRect.size.width/2 - width/2
        y = 0.12 * sizeRect.size.height
        
        var logoImage: UIImage = UIImage(named: "Logo@3x.png")!
        var logoImageView: UIImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: x, y: y, width: width, height: height)
        logoImageView.sizeToFit()
        self.view.addSubview(logoImageView)
        
//        Text Fields
        
        width = verifyPosition(sizeRect.size.width/1.5)
        height = verifyPosition(0.16 * sizeRect.size.width)
        x = verifyPosition(sizeRect.size.width/2 - width/2)
        y = verifyPosition(sizeRect.size.height/2.3)
        
        username.frame = CGRect(x: x, y: y, width: width, height: height)
        username.backgroundColor = UIColor.whiteColor()
        username.placeholder = "Username"
        username.borderStyle = UITextBorderStyle.None
        username.layer.cornerRadius = height/2
        username.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        
        self.view.addSubview(username)
        
        password.frame = CGRect(x: x, y: y + height + 10, width: width, height: height)
        password.backgroundColor = UIColor.whiteColor()
        password.placeholder = "Password"
        password.borderStyle = UITextBorderStyle.None
        password.layer.cornerRadius = height/2
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
