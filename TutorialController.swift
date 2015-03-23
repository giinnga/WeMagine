//
//  TutorialController.swift
//  WeMagine
//
//  Created by Joao Nassar Galante Guedes on 23/03/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class TutorialController: UIViewController, UIGestureRecognizerDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    var badIdea: UIView = UIView()
    var goodIdea: UIView = UIView()
    var goodImage: UIImageView = UIImageView()
    var badImage: UIImageView = UIImageView()
    var lampIconView: UIImageView = UIImageView()
    var deleteView: UIImageView = UIImageView()
    var menuOpenIcon = UIImageView()
    var theCloud = UIImageView()
    
    var step = 0
    
    var tutoText = UILabel()
    
    var cloudImageView: UIImageView = UIImageView()
    
    var cloudWidth = CGFloat()
    var cloudHeight = CGFloat()
    var cloudX = CGFloat()
    var cloudY = CGFloat()
    var rotation:CGFloat = 0.0
    
    var theIdeas:NSMutableArray = NSMutableArray()
    var newIdeasSet:NSMutableArray = NSMutableArray()
    
    var shownIdeaFrame: CGRect = CGRect()
    
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
        
//      Top rectangle
        
        let nextStep = UITapGestureRecognizer(target: self, action:Selector("nextStep"))
        nextStep.delegate = self
        self.view.addGestureRecognizer(nextStep)
        
        width = (375.0 * prop) + 2
        height = (topHeight + barHeight) + 2
        x = -1
        y = -1
        
        deleteView.frame = CGRectMake(0, 0, sizeRect.size.width, sizeRect.size.height + barHeight)
        deleteView.backgroundColor = UIColor.blackColor()
        deleteView.alpha = 0.6
        deleteView.layer.zPosition = 90
        
        var textY = (sizeRect.size.height - 250)/2 + 50
        
        self.view.addSubview(deleteView)
        
        tutoText.frame = CGRectMake((sizeRect.size.width - 250)/2, textY, 250, 250)
        tutoText.font = UIFont(name: "HelveticaNeue", size: 18)
        tutoText.text = "Welcome to We magine!"
        tutoText.lineBreakMode = .ByWordWrapping
        tutoText.numberOfLines = 0
        tutoText.layer.zPosition = 91
        tutoText.textAlignment = .Center
        tutoText.textColor = UIColor.whiteColor()
        
        self.view.addSubview(tutoText)
        
        width = 325.0 * prop * 0.5
        height = 274.0 * prop * 0.5
        x = (sizeRect.size.width - width)/2
        y = textY - height + 80
        
        var image = UIImage(named: "TutoCloud1@2x.png")
        theCloud = UIImageView(image: image)
        theCloud.frame = CGRectMake(x, y, width, height)
        theCloud.layer.zPosition = 91
        
        self.view.addSubview(theCloud)
        
        var topMenuRectangle:UIView = UIView(frame: CGRectMake(x, y, width, height))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        topMenuRectangle.layer.zPosition = 10
        topMenuRectangle.layer.borderWidth = 0.5
        topMenuRectangle.layer.borderColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0).CGColor
        self.view.addSubview(topMenuRectangle)
        
        width = 63.0
        height = 44.0
        x = 0
        y = barHeight
        
        var menuOpen:UIImage = UIImage(named: "MenuIcon@3x.png")!
        menuOpenIcon = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRectMake(x, y, width, height)
        menuOpenIcon.userInteractionEnabled = true
        menuOpenIcon.tag = 1
        menuOpenIcon.layer.zPosition = 11
        self.view.addSubview(menuOpenIcon)
        
        width = 63.0
        height = 44.0
        x = self.sizeRect.width - width
        y = barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        lampIconView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        lampIconView.userInteractionEnabled = true
        lampIconView.layer.zPosition = 11
        self.view.addSubview(lampIconView)
        
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
        
//      Blue & Red rectangles
        
        badIdea = UIView(frame: CGRectMake(0, topHeight + barHeight, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        badIdea.backgroundColor = UIColor(red: 0.9995, green: 0.4959, blue: 0.562, alpha: 1.0)
        self.view.addSubview(badIdea)
        
        goodIdea = UIView(frame: CGRectMake(sizeRect.size.width/2, topHeight + barHeight, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        self.view.addSubview(goodIdea)
        
        
//      Clouds
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - topHeight
        
        cloudWidth = verifyPosition(325.0 * prop)
        cloudHeight = verifyPosition(274.0 * prop)
        cloudX = (sizeRect.size.width - cloudWidth)/2
        cloudY = verifyPosition(((fullHeight - totalHeight)/2) + topHeight + barHeight)
        
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        
        cloudImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRectMake(cloudX,cloudY,cloudWidth,cloudHeight)
        cloudImageView.layer.zPosition = 10
        
        self.view.addSubview(cloudImageView)
        
//      Sad & Happy images
        
        width = 104.0 * prop
        height = 107.0 * prop
        x = (((sizeRect.size.width/2) - width)/2) + sizeRect.size.width/2
        y = cloudY + (274.0 * prop) + (70.0 * prop)
        
        var goodFace:UIImage = UIImage(named: "HappyCloudButton@3x.png")!
        goodImage = UIImageView(image: goodFace)
        goodImage.frame = CGRectMake(x, y, width, height)
        goodImage.userInteractionEnabled = true
        self.view.addSubview(goodImage)
        
        x = (((sizeRect.size.width/2) - width)/2)
        
        var badFace:UIImage = UIImage(named: "SadCloudButton@3x.png")!
        badImage = UIImageView(image: badFace)
        badImage.frame = CGRectMake(x,y,width,height)
        badImage.userInteractionEnabled = true
        self.view.addSubview(badImage)
        
    }
    
    func verifyPosition(measure:CGFloat) -> CGFloat {
        var divisionRest = measure % 1
        var correctValue = measure + 1 - divisionRest
        return correctValue
    }
    
    func nextStep() {
        step += 1
        
        if(step==1) {
            tutoText.text = "Here you will learn how to use the app."
        }
        
        if(step==2) {
            tutoText.text = "Some random idea will appear in this cloud!"
            cloudImageView.layer.zPosition = 99
            theCloud.alpha = 0
            tutoText.frame.origin.y = tutoText.frame.origin.y + 120
        }
        
        if(step==3) {
            tutoText.text = "Tap here if you like the idea!"
            cloudImageView.layer.zPosition = 80
            goodImage.layer.zPosition = 99
            tutoText.frame.origin.y = tutoText.frame.origin.y - 120
        }
        
        if(step==4) {
            tutoText.text = "And if you don't like it, tap here."
            goodImage.layer.zPosition = 80
            badImage.layer.zPosition = 99
        }
        
        if(step==5) {
            tutoText.text = "If you are logged in, you can send your ideas by tapping this lamp."
            badImage.layer.zPosition = 80
            theCloud.alpha = 1
            var image = UIImage(named: "TutoCloud2@2x.png")
            theCloud.image = image
            lampIconView.layer.zPosition = 99
        }
        
        if(step==6) {
            tutoText.text = "Tap here to open the app menu."
            lampIconView.layer.zPosition = 80
            menuOpenIcon.layer.zPosition = 99
        }
        
        if(step==7) {
            var image = UIImage(named: "TutoCloud4@2x.png")
            theCloud.image = image
            tutoText.text = "Here you can view all the ideas you've sent and log out if you want to."
        }
        
        if(step==8) {
            tutoText.text = "You can also watch this tutorial again!"
        }
        
        if(step==9) {
            var image = UIImage(named: "TutoCloud3@2x.png")
            theCloud.image = image
            tutoText.text = "Enjoy the app!\nAnd keep imagining!"
            menuOpenIcon.layer.zPosition = 80
        }
        if(step==10) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}
