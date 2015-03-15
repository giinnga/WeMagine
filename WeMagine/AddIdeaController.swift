//
//  AddIdeaController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/13/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class AddIdeaController: UIViewController, UIGestureRecognizerDelegate, UITextViewDelegate {

    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    var menuView:UIView = UIView()
    var menuViewHidden: Bool = true
    var textField: UITextView = UITextView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        
        //        Top rectangle
        
        width = 375.0 * prop
        height = (59.0 * prop) + barHeight
        x = 0.0
        y = 0.0
        
        var topMenuRectangle:UIView = UIView(frame: CGRectMake(x, y, width, height))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topMenuRectangle)
        
        width = 26.0 * prop
        height = 23.0 * prop
        x = 12.0
        y = ((59.0 * prop) - height)/2 + barHeight
        
        var menuOpen:UIImage = UIImage(named: "MenuIcon@3x.png")!
        var menuOpenIcon: UIImageView = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRectMake(x, y, width, height)
        menuOpenIcon.userInteractionEnabled = true
        menuOpenIcon.tag = 1
        self.view.addSubview(menuOpenIcon)
        
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        recognizer.delegate = self
        menuOpenIcon.addGestureRecognizer(recognizer)
        
        width = 38.0 * prop
        height = 35.0 * prop
        x = self.sizeRect.width - width - 8.0
        y = ((59.0 * prop) - height)/2 + barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.userInteractionEnabled = true
        lampIconView.frame = CGRectMake(x, y, width, height)
        self.view.addSubview(lampIconView)
        
        let newIdea = UITapGestureRecognizer(target: self, action:Selector("newIdea:"))
        newIdea.delegate = self
        lampIconView.addGestureRecognizer(newIdea)
        
        fontSize = verifyPosition(0.0587 * sizeRect.size.width) - 1
        
        x = verifyPosition(0.15 * sizeRect.size.width)
        y = verifyPosition(24 + sizeRect.size.height/48)
        
        let weMagineLabel = UILabel(frame: CGRect(x: x, y: y, width: 300, height: 300))
        weMagineLabel.font = UIFont(name: "HelveticaNeue", size: fontSize)
        weMagineLabel.text = "We magine!"
        weMagineLabel.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        weMagineLabel.sizeToFit()
        self.view.addSubview(weMagineLabel)
        
//        Blue View
        
        var goodIdea: UIView = UIView(frame: CGRectMake(0 , (59.0 * prop) + barHeight, sizeRect.size.width, sizeRect.size.height/1.5+barHeight))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
        self.view.addSubview(goodIdea)
        
//        Button Area
        
        var buttonAreaView: UIView = UIView(frame: CGRect(x: 0, y: sizeRect.size.height/1.5+barHeight, width: sizeRect.size.width, height: sizeRect.size.height/2.5))
        buttonAreaView.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
        self.view.addSubview(buttonAreaView)
        
//        Cloud
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - (59.0 * prop)
        
        width = verifyPosition(325.0 * prop)
        height = verifyPosition(274.0 * prop)
        x = verifyPosition((sizeRect.size.width - width)/2)
        y = verifyPosition(((sizeRect.size.height/3) - height/2) + (59.0 * prop))
        
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        var cloudImageView: UIImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRectMake(x,y,width,height)
        cloudImageView.userInteractionEnabled = true
        self.view.addSubview(cloudImageView)
        
//        Menu View
        
        menuView = UIView(frame: CGRect(x: -sizeRect.size.width/2, y: topMenuRectangle.frame.size.height, width: sizeRect.size.width/2, height: sizeRect.size.height))
        menuView.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
        self.view.addSubview(menuView)
        
//        Menu View Rectangles
        
        width = sizeRect.size.width/2
        height = sizeRect.size.height/10
        
        fontSize = verifyPosition(0.048 * sizeRect.size.width) - 1
        
        x = verifyPosition(width/8.5)
        y = verifyPosition(height/3)
        
        var share:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        share.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(share)
        
        var shareLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        shareLabel.text = "Share Imagination"
        shareLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        shareLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        shareLabel.sizeToFit()
        share.addSubview(shareLabel)
        
        
        var myIdeas: UIView = UIView(frame: CGRect(x: 0, y: sizeRect.size.height/10, width: width, height: height))
        myIdeas.backgroundColor = UIColor(red: 0.9608, green: 0.9294, blue: 0.9059, alpha: 1.0)
        menuView.addSubview(myIdeas)
        
        var myIdeasLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        myIdeasLabel.text = "My shared ideas"
        myIdeasLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        myIdeasLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        myIdeasLabel.sizeToFit()
        myIdeas.addSubview(myIdeasLabel)
        
        var profile:UIView = UIView(frame: CGRect(x: 0, y: 2*sizeRect.size.height/10, width: width, height: height))
        profile.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(profile)
        
        var profileLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        profileLabel.text = "Profile"
        profileLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        profileLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        profileLabel.sizeToFit()
        profile.addSubview(profileLabel)
        
        var settings: UIView = UIView(frame: CGRect(x: 0, y: 3 * sizeRect.size.height/10, width: width, height: height))
        settings.backgroundColor = UIColor(red: 0.9608, green: 0.9294, blue: 0.9059, alpha: 1.0)
        menuView.addSubview(settings)
        
        var settingsLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        settingsLabel.text = "Settings"
        settingsLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        settingsLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        settingsLabel.sizeToFit()
        settings.addSubview(settingsLabel)
        
        var logout:UIView = UIView(frame: CGRect(x: 0, y: 4*sizeRect.size.height/10, width: width, height: height))
        logout.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(logout)
        
        var logoutLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        logoutLabel.text = "Logout"
        logoutLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        logoutLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        logoutLabel.sizeToFit()
        logout.addSubview(logoutLabel)
        
//        Text Field
        
        width = verifyPosition(cloudImageView.frame.size.width/1.28)
        height = verifyPosition(cloudImageView.frame.size.height/1.8)
        x = verifyPosition(cloudImageView.frame.size.width/2 - width/2)
        y = verifyPosition(cloudImageView.frame.size.height/2 - height/2)
        fontSize = verifyPosition(0.046875 * sizeRect.size.width) - 1
        
        textField = UITextView(frame: CGRect(x: x, y: y, width: width, height: height))
//        textField.backgroundColor = UIColor.redColor()
        textField.userInteractionEnabled = true
        textField.editable = true
        textField.autocorrectionType = UITextAutocorrectionType.Default;
        textField.scrollEnabled = false
        textField.keyboardType = UIKeyboardType.Default;
        textField.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        textField.font = UIFont(name: "HelveticaNeue", size: fontSize)
        textField.delegate = self
        textField.textAlignment = .Center
        cloudImageView.addSubview(textField)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        if(menuViewHidden){
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = 0
                self.menuViewHidden = false
            })
        }
        else{
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = -self.verifyPosition(self.sizeRect.size.width/2)
                self.menuViewHidden = true
            })
        }
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        
        return (textView.text as NSString).length + ((text as NSString).length - range.length) <= 137
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        self.centerText()
    }
    
    func textViewDidChange(textView: UITextView) {
        self.centerText()
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        
        let secondViewController:ViewController = ViewController()

        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    func verifyPosition(measure:CGFloat) -> CGFloat
    {
        var divisionRest = measure % 1
        var correctValue = measure + 1 - divisionRest
        return correctValue
    }
    
    func centerText()
    {
        var tf: UITextView = self.textField as UITextView
        var size: CGSize = tf.sizeThatFits(CGSize(width: self.textField.bounds.width, height: 1000))
        var topCorrect = (self.textField.bounds.height - size.height * self.textField.zoomScale)/2
        topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect)
        self.textField.contentOffset.x = 0
        self.textField.contentOffset.y = -topCorrect
    }
    
}