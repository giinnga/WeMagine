//
//  AddIdeaController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/13/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class AddIdeaController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    var menuView:UIView = UIView()
    var menuViewHidden: Bool = true
    var textField: UITextField = UITextField()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y:CGFloat
        
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
        lampIconView.frame = CGRectMake(x, y, width, height)
        self.view.addSubview(lampIconView)
        
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
        
        width = 325.0 * prop
        height = 274.0 * prop
        x = (sizeRect.size.width - width)/2
        y = ((sizeRect.size.height/3) - height/2) + (59.0 * prop)
        
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
        
        var share:UIView = UIView(frame: CGRect(x: 0, y: 0, width: sizeRect.size.width/2, height: sizeRect.size.height/10))
        share.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(share)
        
        var profile:UIView = UIView(frame: CGRect(x: 0, y: 2*sizeRect.size.height/10, width: sizeRect.size.width/2, height: sizeRect.size.height/10))
        profile.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(profile)
        
        var logout:UIView = UIView(frame: CGRect(x: 0, y: 4*sizeRect.size.height/10, width: sizeRect.size.width/2,
            height: sizeRect.size.height/10))
        logout.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(logout)
        
//        Text Field
        
        textField = UITextField(frame: CGRect(x: cloudImageView.frame.size.width/6, y: cloudImageView.frame.size.height/5, width: cloudImageView.frame.size.width/1.5, height: cloudImageView.frame.size.height/1.8))
//        textField.backgroundColor = UIColor.redColor()
        textField.userInteractionEnabled = true
        textField.enabled = true
        textField.autocorrectionType = UITextAutocorrectionType.No;
        textField.keyboardType = UIKeyboardType.Default;
        textField.placeholder = "Teste"
        textField.delegate = self
        println(textField.enabled)
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
                self.menuView.frame.origin.x = -self.sizeRect.size.width/2
                self.menuViewHidden = true
            })
        }
        
    }
    
}