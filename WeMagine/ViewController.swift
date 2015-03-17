//
//  ViewController.swift
//  WeMagine
//
//  Created by Victor Souza on 3/12/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    var menuView:UIView = UIView()
    var badIdea: UIView = UIView()
    var goodIdea: UIView = UIView()
    var goodImage: UIImageView = UIImageView()
    var badImage: UIImageView = UIImageView()
    
    var cloudImageView: UIImageView = UIImageView()
    var cloudFadeImageView: UIImageView = UIImageView()
    var textView: UITextView = UITextView()
    var fadeText: UITextView = UITextView()
    
    var cloudWidth = CGFloat()
    var cloudHeight = CGFloat()
    var cloudX = CGFloat()
    var cloudY = CGFloat()
    
    var menuViewHidden: Bool = true
    var mayVote: Bool = true
    var finished: Bool = false

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
        
        width = (375.0 * prop) + 2
        height = (topHeight + barHeight) + 2
        x = -1
        y = -1
        
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
        var menuOpenIcon: UIImageView = UIImageView(image: menuOpen)
        menuOpenIcon.frame = CGRectMake(x, y, width, height)
        menuOpenIcon.userInteractionEnabled = true
        menuOpenIcon.tag = 1
        menuOpenIcon.layer.zPosition = 11
        self.view.addSubview(menuOpenIcon)
        
        let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        recognizer.delegate = self
        menuOpenIcon.addGestureRecognizer(recognizer)
        
        width = 63.0
        height = 44.0
        x = self.sizeRect.width - width
        y = barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        lampIconView.userInteractionEnabled = true
        lampIconView.layer.zPosition = 11
        self.view.addSubview(lampIconView)
        
        let newIdea = UITapGestureRecognizer(target: self, action:Selector("newIdea:"))
        newIdea.delegate = self
        lampIconView.addGestureRecognizer(newIdea)
        
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
        badIdea.userInteractionEnabled = true
        self.view.addSubview(badIdea)
        
        goodIdea = UIView(frame: CGRectMake(sizeRect.size.width/2, topHeight + barHeight, sizeRect.size.width/2, sizeRect.size.height+barHeight))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
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
        cloudImageView.frame = CGRectMake(cloudX+2000,cloudY,cloudWidth,cloudHeight)
        cloudFadeImageView = UIImageView(image: cloudImage)
        cloudFadeImageView.frame = CGRectMake(cloudX+2000,cloudY,cloudWidth,cloudHeight)
        
        self.view.addSubview(cloudImageView)
        self.view.addSubview(cloudFadeImageView)
        
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
        
        //let sadVote = UILongPressGestureRecognizer(target: self, action:Selector("sadVote:"))
        //sadVote.delegate = self
        //badImage.addGestureRecognizer(sadVote)
        
//      Recognizers
        
        let badVote = UITapGestureRecognizer(target: self, action:Selector("badVote:"))
        badVote.delegate = self
        badImage.addGestureRecognizer(badVote)
      
        let goodVote = UITapGestureRecognizer(target: self, action:Selector("goodVote:"))
        goodVote.delegate = self
        goodImage.addGestureRecognizer(goodVote)
        
//      Menu View
        
        menuView = UIView(frame: CGRect(x: -sizeRect.size.width/2, y: topMenuRectangle.frame.size.height - 1, width: sizeRect.size.width/2, height: sizeRect.size.height + 1))
        menuView.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
        self.view.addSubview(menuView)
        
//      Menu View Rectangles
        
        width = verifyPosition(sizeRect.size.width/2) - 1
        height = verifyPosition(sizeRect.size.height/10) - 1
        
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
        
        let shareGesture = UITapGestureRecognizer(target: self, action:Selector("newIdeaTap:"))
        shareGesture.delegate = self
        share.addGestureRecognizer(shareGesture)
        
        var myIdeas: UIView = UIView(frame: CGRect(x: 0, y: sizeRect.size.height/10, width: width, height: height))
        myIdeas.backgroundColor = UIColor(red: 0.9608, green: 0.9294, blue: 0.9059, alpha: 1.0)
        menuView.addSubview(myIdeas)
        
        var myIdeasLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        myIdeasLabel.text = "My shared ideas"
        myIdeasLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        myIdeasLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        myIdeasLabel.sizeToFit()
        myIdeas.addSubview(myIdeasLabel)
        
        let myIdeasGesture = UITapGestureRecognizer(target: self, action:Selector("myIdeas:"))
        myIdeasGesture.delegate = self
        myIdeas.addGestureRecognizer(myIdeasGesture)
        
        var profile:UIView = UIView(frame: CGRect(x: 0, y: 2 * sizeRect.size.height/10, width: width, height: height))
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
        
        var logout:UIView = UIView(frame: CGRect(x: 0, y: 4 * sizeRect.size.height/10, width: width, height: height))
        logout.backgroundColor = UIColor(red: 0.7357, green: 0.639, blue: 0.5589, alpha: 1.0)
        menuView.addSubview(logout)
        
        var logoutLabel:UILabel = UILabel(frame: CGRect(x: x, y: y, width: 10 , height: 10))
        logoutLabel.text = "Logout"
        logoutLabel.textColor = UIColor(red: 0.3191, green: 0.3191, blue: 0.3191, alpha: 1.0)
        logoutLabel.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        logoutLabel.sizeToFit()
        logout.addSubview(logoutLabel)
        
//      Frames
        
        width = verifyPosition(cloudImageView.frame.size.width/1.28)
        height = verifyPosition(cloudImageView.frame.size.height/1.8)
        x = verifyPosition(cloudImageView.frame.size.width/2 - width/2)
        y = verifyPosition(cloudImageView.frame.size.height/2 - height/2)
        
        shownIdeaFrame = CGRect(x: x, y: y, width: width, height: height)
        
//      CloudText
        
        fontSize = verifyPosition(0.046875 * sizeRect.size.width) - 1
        
        fadeText = UITextView(frame: shownIdeaFrame)
        fadeText.scrollEnabled = false
        fadeText.textAlignment = .Center
        fadeText.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        fadeText.font = UIFont(name: "HelveticaNeue", size: fontSize)
        fadeText.backgroundColor = nil
        fadeText.layer.zPosition = 9
        cloudFadeImageView.addSubview(fadeText)
        
        fadeText.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.New, context: nil)
        
        textView = UITextView(frame: shownIdeaFrame)
        textView.scrollEnabled = false
        textView.textAlignment = .Center
        textView.textColor = UIColor(red: 0.1725, green: 0.3294, blue: 0.4784, alpha: 1.0)
        textView.font = UIFont(name: "HelveticaNeue", size: fontSize)
        textView.backgroundColor = nil
        textView.layer.zPosition = 9
        cloudImageView.addSubview(textView)
        
        textView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.New, context: nil)
        
        centerText()
        setNewIdea()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.centerText()
        

    }
    
//    Gestures

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goodVote(recognizer: UITapGestureRecognizer) {
        if(mayVote) {
            likeIdea()
        }
    }
    
    func badVote(recognizer: UITapGestureRecognizer) {
        if(mayVote) {
            dislikeIdea()
        }
    }
    
    func myIdeas(recognizer: UITapGestureRecognizer) {
        if(!mayVote)
        {
            performSegueWithIdentifier("myIdeas", sender: self)
        }
    }
    
//    func sadVote(recognizer: UILongPressGestureRecognizer) {
//        if recognizer.state == UIGestureRecognizerState.Began
//        {
//            println("foi")
//        }
//    }
    
    func newIdeaTap(recognizer: UITapGestureRecognizer) {
        
        performSegueWithIdentifier("newIdea", sender: self)
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        
        performSegueWithIdentifier("newIdea", sender: self)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        
        let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        let endXPosition = 0 as CGFloat
        
        let startXPosition = -self.sizeRect.size.width/2 as CGFloat
        
        let offset = (0.1*(endXPosition - startXPosition))
        
        if(menuViewHidden) {
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = self.verifyPosition(endXPosition) - 1
                self.mayVote = false
                self.menuViewHidden = false
            })
        }
        else {
            UIView.animateWithDuration(0.3, animations: {
                self.menuView.frame.origin.x = -self.verifyPosition(self.sizeRect.size.width/2)
                self.menuViewHidden = true
                self.mayVote = true
            })
        }
    }
    
//  Next Idea
    
    func setNewIdea()
    {
        
        self.fadeText.text = self.getNewIdea()
        
        UIView.animateWithDuration(0.3, animations: {
            self.cloudFadeImageView.frame.origin.x = self.cloudX
        }, completion: {
            (value: Bool) in
            self.centerText()
            self.cloudFadeImageView.frame.origin.x = self.cloudX+self.sizeRect.size.width
            self.cloudImageView.alpha = 1
            self.cloudImageView.frame = CGRectMake(self.cloudX, self.cloudY, self.cloudWidth, self.cloudHeight)
            self.textView.text = self.fadeText.text
        })
        
    }
    
    func likeIdea() {
        
        var prop: CGFloat = sizeRect.size.width/375.0
        
        goodImage.image = UIImage(named: "HappyPressedButton@3x.png")
        goodImage.frame.size.height = 103 * prop
        goodImage.frame.origin.y = goodImage.frame.origin.y + 4
        goodIdea.backgroundColor = UIColor(red: 87.0/255.0, green: 219.0/255.0, blue: 1, alpha: 1)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.12, target: self, selector: Selector("animateLike"), userInfo: nil, repeats: false)
        
    }
    
    func animateLike() {
        
        var prop: CGFloat = sizeRect.size.width/375.0
        
        self.goodImage.image = UIImage(named: "HappyCloudButton@3x.png")
        self.goodImage.frame.size.height = 107 * prop
        self.goodImage.frame.origin.y = self.goodImage.frame.origin.y - 4
        self.goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        
        UIView.animateWithDuration(0.3, animations: {
            self.cloudImageView.frame.origin.y = self.cloudY-(self.cloudHeight*2)
            }, completion: {
                (value: Bool) in
                self.setNewIdea()
        })
        
    }
    
    func dislikeIdea() {
        
        var prop: CGFloat = sizeRect.size.width/375.0
        
        badImage.image = UIImage(named: "SadPressedButton@3x.png")
        badImage.frame.size.height = 103 * prop
        badImage.frame.origin.y = badImage.frame.origin.y + 4
        badIdea.backgroundColor = UIColor(red: 255.0/255.0, green: 78.0/255.0, blue: 100.0/255.0, alpha: 1)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.12, target: self, selector: Selector("animateDislike"), userInfo: nil, repeats: false)
        
    }
    
    func animateDislike() {
        
        var prop: CGFloat = sizeRect.size.width/375.0
        
        self.badImage.image = UIImage(named: "SadCloudButton@3x.png")
        self.badImage.frame.size.height = 107 * prop
        self.badImage.frame.origin.y = self.badImage.frame.origin.y - 4
        self.badIdea.backgroundColor = UIColor(red: 0.9995, green: 0.4959, blue: 0.562, alpha: 1.0)
        
        UIView.animateWithDuration(0.3, animations: {
            self.cloudImageView.alpha = 0
            }, completion: {
                (value: Bool) in
                self.setNewIdea()
        })
        
    }
    
    func centerText()
    {
        var tf: UITextView = self.fadeText as UITextView
        var size: CGSize = tf.sizeThatFits(CGSize(width: self.fadeText.bounds.width, height: 10000))
        var topCorrectFade = (self.fadeText.bounds.height - size.height * self.fadeText.zoomScale)/2
        topCorrectFade = (topCorrectFade < 0.0 ? 0.0 : topCorrectFade)
        self.fadeText.contentOffset.x = 0
        self.fadeText.contentOffset.y = -topCorrectFade
        
        var tt: UITextView = self.textView as UITextView
        var sizeT: CGSize = tt.sizeThatFits(CGSize(width: self.textView.bounds.width, height: 10000))
        var topCorrect = (self.textView.bounds.height - sizeT.height * self.textView.zoomScale)/2
        topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect)
        self.textView.contentOffset.x = 0
        self.textView.contentOffset.y = -topCorrect
    }
    
    func getNewIdea() -> String {
        return "Um cinema só para golfinhos é uma boa ideia para testar o app!"
    }
    
//  Segue
    
    override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
        if identifier == "newIdea"
        {
            let secondViewController:AddIdeaController = AddIdeaController()
            self.presentViewController(secondViewController, animated: true, completion: nil)
        }
        
        else if identifier == "myIdeas"
        {
            let secondViewController:MySharedIdeas = MySharedIdeas()
            self.presentViewController(secondViewController, animated: true, completion: nil)
        }
    }
    
    func verifyPosition(measure:CGFloat) -> CGFloat
    {
        var divisionRest = measure % 1
        var correctValue = measure + 1 - divisionRest
        return correctValue
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        var tf: UITextView = object as UITextView
        var size: CGSize = tf.sizeThatFits(CGSize(width: self.textView.bounds.width, height: 1000))
        var topCorrect = (tf.bounds.size.height - (size.height * tf.zoomScale))/2
        topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect)
        tf.contentOffset.x = 0
        tf.contentOffset.y = -topCorrect
    }
    
}

