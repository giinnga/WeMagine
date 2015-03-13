//
//  ViewController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/12/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    var tap: UITapGestureRecognizer = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y:CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        
//        Blue & Red rectangles
        
        var badIdea: UIView = UIView(frame: CGRectMake(0, 0, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        badIdea.backgroundColor = UIColor(red: 0.9995, green: 0.4959, blue: 0.562, alpha: 1.0)
        badIdea.userInteractionEnabled = true
        self.view.addSubview(badIdea)
        
        var goodIdea: UIView = UIView(frame: CGRectMake(sizeRect.size.width/2, 0, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
        self.view.addSubview(goodIdea)
        
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
        var menuOpenIcon:UIImageView = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRectMake(x, y, width, height)
        self.view.addSubview(menuOpenIcon)
        
        width = 38.0 * prop
        height = 35.0 * prop
        x = self.sizeRect.width - width - 8.0
        y = ((59.0 * prop) - height)/2 + barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        self.view.addSubview(lampIconView)
        
//        Cloud
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - (59.0 * prop)
        
        width = 325.0 * prop
        height = 274.0 * prop
        x = (sizeRect.size.width - width)/2
        y = ((fullHeight - totalHeight)/2) + (59.0 * prop) + barHeight
    
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
        self.view.addSubview(badImage)
        
        
//        println(cloudImage.size.height/sizeRect.size.height)
        
//        UITextView
        
        var textView: UITextView = UITextView(frame: CGRect(x: cloudImageView.frame.size.width/6, y: cloudImageView.frame.size.height/5, width: cloudImageView.frame.size.width/1.5, height: cloudImageView.frame.size.height/1.8))
        textView.scrollEnabled = false
        textView.text = String("E se existisse um cinema só para golfinhos")
        textView.textAlignment = .Center
//        textView.backgroundColor = UIColor.redColor()
        cloudImageView.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.allObjects[0] as UITouch
        let touchLocation = touch.locationInView(self.view)
        println(touchLocation)
        
        if touchLocation.x < sizeRect.width/2
        {
            println("esquerda")
        }
        else
        {
            println("direita")
        }
        
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }

}

