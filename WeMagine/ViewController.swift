//
//  ViewController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/12/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    var menuView:UIView = UIView()
    var badIdea: UIView = UIView()
    var goodIdea: UIView = UIView()
    var menuViewHidden: Bool = true
    var mayVote: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y:CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        
        var topHeight = 40.0 * prop
        
//        Blue & Red rectangles
        
        badIdea = UIView(frame: CGRectMake(0, 0, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        badIdea.backgroundColor = UIColor(red: 0.9995, green: 0.4959, blue: 0.562, alpha: 1.0)
        badIdea.userInteractionEnabled = true
        self.view.addSubview(badIdea)
        
        let badVote = UITapGestureRecognizer(target: self, action:Selector("badVote:"))
        badVote.delegate = self
        badIdea.addGestureRecognizer(badVote)
        
        goodIdea = UIView(frame: CGRectMake(sizeRect.size.width/2, 0, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
        self.view.addSubview(goodIdea)
        
        let goodVote = UITapGestureRecognizer(target: self, action:Selector("goodVote:"))
        goodVote.delegate = self
        goodIdea.addGestureRecognizer(goodVote)
        
        
//        Top rectangle
        
        var iconProp: CGFloat = 0.85
        
        width = 375.0 * prop
        height = topHeight + barHeight
        x = 0.0
        y = 0.0
        
        var topMenuRectangle:UIView = UIView(frame: CGRectMake(x, y, width, height))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topMenuRectangle)
        
        width = 26.0 * prop * iconProp
        height = 23.0 * prop * iconProp
        x = 12.0
        y = (topHeight - height)/2 + barHeight
        
        var menuOpen:UIImage = UIImage(named: "MenuIcon@3x.png")!
        var menuOpenIcon: UIImageView = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRectMake(x, y, width, height)
        menuOpenIcon.userInteractionEnabled = true
        menuOpenIcon.tag = 1
        self.view.addSubview(menuOpenIcon)
        
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        recognizer.delegate = self
        menuOpenIcon.addGestureRecognizer(recognizer)
        
        width = 38.0 * prop * iconProp
        height = 35.0 * prop * iconProp
        x = self.sizeRect.width - width - 8.0
        y = (topHeight - height)/2 + barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        lampIconView.userInteractionEnabled = true
        self.view.addSubview(lampIconView)
        
        let newIdea = UITapGestureRecognizer(target: self, action:Selector("newIdea:"))
        newIdea.delegate = self
        lampIconView.addGestureRecognizer(newIdea)
        
//        Cloud
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - topHeight
        
        width = 325.0 * prop
        height = 274.0 * prop
        x = (sizeRect.size.width - width)/2
        y = ((fullHeight - totalHeight)/2) + topHeight + barHeight
    
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        var cloudImageView: UIImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRectMake(x,y,width,height)
        self.view.addSubview(cloudImageView)
        
//        Sad & Happy images

        width = 104.0 * prop
        height = 107.0 * prop
        x = (((sizeRect.size.width/2) - width)/2) + sizeRect.size.width/2
        y = y + (274.0 * prop) + (70.0 * prop)
        
        var goodFace:UIImage = UIImage(named: "HappyCloudButton@3x.png")!
        var goodImage:UIImageView = UIImageView(image: goodFace)
        goodImage.frame = CGRectMake(x, y, width, height)
        self.view.addSubview(goodImage)
        
        x = (((sizeRect.size.width/2) - width)/2)
        
        var badFace:UIImage = UIImage(named: "SadCloudButton@3x.png")!
        var badImage:UIImageView = UIImageView(image: badFace)
        badImage.frame = CGRectMake(x,y,width,height)
//        badImage.userInteractionEnabled = true
        self.view.addSubview(badImage)
        
//        let sadVote = UILongPressGestureRecognizer(target: self, action:Selector("sadVote:"))
//        sadVote.delegate = self
//        badImage.addGestureRecognizer(sadVote)
        
//        UITextView
        
        var textView: UITextView = UITextView(frame: CGRect(x: cloudImageView.frame.size.width/6, y: cloudImageView.frame.size.height/5, width: cloudImageView.frame.size.width/1.5, height: cloudImageView.frame.size.height/1.8))
        textView.scrollEnabled = false
        textView.text = String("E se existisse um cinema só para golfinhos")
        textView.textAlignment = .Center
//        textView.backgroundColor = UIColor.redColor()
        cloudImageView.addSubview(textView)
        
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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goodVote(recognizer: UITapGestureRecognizer) {
        if(mayVote)
        {
            println("goodVote")
        }
    }
    
    func badVote(recognizer: UITapGestureRecognizer) {
        if(mayVote)
        {
            println("badVote")
        }
    }
    
    func sadVote(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began
        {
            println("foi")
        }
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        println("newIdea")
        let secondViewController:AddIdeaController = AddIdeaController()
        
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        if(menuViewHidden){
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = 0
                self.menuViewHidden = false
                self.mayVote = false
            })
        }
        else{
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = -self.sizeRect.size.width/2
                self.menuViewHidden = true
                self.mayVote = true
            })
        }
        
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }

}

