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
        
//        Top rectangle
        
        var topMenuRectangle:UIView = UIView(frame: CGRect(x: 0, y: app.statusBarFrame.size.height, width: sizeRect.size.width, height: sizeRect.size.height * 0.0825))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topMenuRectangle)
        
        var menuOpen:UIImage = UIImage(named: "MenuIcon@3x.png")!
        var menuOpenIcon:UIImageView = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRect(x: 0.025 * sizeRect.size.width, y: topMenuRectangle.frame.size.height/2 - menuOpen.size.height/2, width: 0.0906666666666667 * sizeRect.size.width, height: 0.035548686244204 * sizeRect.size.height)
        topMenuRectangle.addSubview(menuOpenIcon)
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRect(x: sizeRect.size.width - 1.2 * lampIcon.size.width, y: topMenuRectangle.frame.size.height/2 - lampIcon.size.height/2, width: 0.114666666666667 * sizeRect.size.width, height: 0.0556414219474498 * sizeRect.size.height)
        topMenuRectangle.addSubview(lampIconView)
        
        
//        Blue & Red rectangles
        
        var badIdea: UIView = UIView(frame: CGRect(x: 0, y: app.statusBarFrame.size.height + topMenuRectangle.frame.size.height, width: sizeRect.size.width/2, height: sizeRect.size.height))
        badIdea.backgroundColor = UIColor(red: 0.9995, green: 0.4959, blue: 0.562, alpha: 1.0)
        badIdea.userInteractionEnabled = true
        self.view.addSubview(badIdea)
        
        var goodIdea: UIView = UIView(frame: CGRect(x: sizeRect.size.width/2, y: app.statusBarFrame.size.height + topMenuRectangle.frame.size.height, width: sizeRect.size.width/2, height: sizeRect.size.height))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
        self.view.addSubview(goodIdea)
        
//        Sad & Happy images
        
        var goodFace:UIImage = UIImage(named: "HappyCloudButton@3x.png")!
        var goodImage:UIImageView = UIImageView(image: goodFace)
        goodImage.frame = CGRectMake(goodIdea.frame.size.width/2 - 0.277333333333333/2 * sizeRect.size.width, sizeRect.size.height * 0.7, 0.277333333333333 * sizeRect.size.width, 0.165378670788253 * sizeRect.size.height)
        goodIdea.addSubview(goodImage)
        
        var badFace:UIImage = UIImage(named: "SadCloudButton@3x.png")!
        var badImage:UIImageView = UIImageView(image: badFace)
        badImage.frame = CGRectMake(badIdea.frame.size.width/2 - 0.277333333333333/2 * sizeRect.size.width, badIdea.frame.size.height * 0.7, 0.277333333333333 * sizeRect.size.width, 0.165378670788253 * sizeRect.size.height)
        badIdea.addSubview(badImage)
        
//        Cloud
        
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        var cloudImageView: UIImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRect(x: sizeRect.size.width/2 - 0.866666666666667/2 * sizeRect.size.width, y: sizeRect.size.height/2 - 0.423493044822257/2 * sizeRect.size.height, width: 0.866666666666667 * sizeRect.size.width, height: 0.423493044822257 * sizeRect.size.height)
        self.view.addSubview(cloudImageView)
        
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

}

