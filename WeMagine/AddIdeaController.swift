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
    
    var task = NSURLSessionDataTask()
    
    var menuView:UIView = UIView()
    
    var menuViewHidden: Bool = true
    var maySendOrBack = true
    
    var username = String()
    var useremail = String()
    
    var textField: UITextView = UITextView()
    
    var sendYourIdea: UIImageView = UIImageView()
    var cancelIdea: UIImageView = UIImageView()
    var cloudImageView: UIImageView = UIImageView()
    var happyCloudImageView: UIImageView = UIImageView()
    var tutorial: UIImageView = UIImageView()
    var loadSprite: UIImageView = UIImageView()
    
    var CloudW = CGFloat()
    var CloudH = CGFloat()
    var CloudX = CGFloat()
    var CloudY = CGFloat()
    var rotation = CGFloat()
    
    var barHeight:CGFloat = CGFloat()
    var topHeight:CGFloat = 44.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        barHeight = app.statusBarFrame.size.height
        
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
        
        width = 84.0
        height = 44.0
        x = -1
        y = -1 + barHeight
        
        var lampIcon:UIImage = UIImage(named: "BackButton@3x.png")!
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
        
//      Button Area
        
        var buttonAreaView: UIView = UIView(frame: CGRectMake(0, topHeight + barHeight, sizeRect.size.width, sizeRect.size.height))
        buttonAreaView.backgroundColor = UIColor(red: 0.9601, green: 0.9307, blue: 0.9053, alpha: 1.0)
        self.view.addSubview(buttonAreaView)
        
//      Blue View
        
        width = sizeRect.size.width
        height = 349 * prop
        x = 0
        y = topHeight + barHeight
        
        var goodIdea: UIView = UIView(frame: CGRectMake(x,y,width,height))
        goodIdea.backgroundColor = UIColor(red: 0.6192, green: 0.9166, blue: 1.0, alpha: 1.0)
        goodIdea.userInteractionEnabled = true
        self.view.addSubview(goodIdea)
        
//      Loading Sprite
        
        CloudW = verifyPosition(325.0 * prop)
        CloudH = verifyPosition(274.0 * prop)
        CloudX = verifyPosition((sizeRect.size.width - CloudW)/2)
        CloudY = verifyPosition((349*prop - CloudH)/2 + topHeight + barHeight)
        
        width = 74.0 * prop * 1.3
        height = 74.0 * prop * 1.3
        x = (sizeRect.size.width - width)/2
        y = CloudY + 80.0
        
        var loadImage: UIImage = UIImage(named: "LoadCloud@3x.png")!
        loadSprite = UIImageView(image: loadImage)
        loadSprite.frame = CGRectMake(x,y,width,height)
        loadSprite.alpha = 0
        self.view.addSubview(loadSprite)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("animateLoadIcon"), userInfo: nil, repeats: true)
        
//      Cloud
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - topHeight
        
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        cloudImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRectMake(CloudX,CloudY,CloudW,CloudH)
        cloudImageView.userInteractionEnabled = true
        cloudImageView.alpha = 1
        self.view.addSubview(cloudImageView)
        
        var happyImage:UIImage = UIImage(named: "HappyUpCloud1@3x.png")!
        happyCloudImageView = UIImageView(image: happyImage)
        happyCloudImageView.frame = CGRectMake(0, 0, CloudW, CloudH)
        happyCloudImageView.alpha = 0
        
        cloudImageView.addSubview(happyCloudImageView)
        
//      Tutorial
        
        width = 201.0 * prop
        height = 180.0 * prop
        x = (sizeRect.size.width - width)/2
        y = CloudY + (274.0 * prop) - 20.0
        
        var tutoImage: UIImage = UIImage(named: "SendTutorial@3x.png")!
        tutorial = UIImageView(image: tutoImage)
        tutorial.frame = CGRectMake(x,y,width,height)
        
        self.view.addSubview(tutorial)
        
        
//      Text Field
        
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
        textField.alpha = 1
        cloudImageView.addSubview(textField)
        
//      Send your idea
        
        var brownHeight:CGFloat = sizeRect.size.height - (topHeight + (349 * prop))
        var buttonProp:CGFloat = brownHeight/274
    
        width = verifyPosition(154.0 * buttonProp)
        height = verifyPosition(159.0 * buttonProp)
        x = (sizeRect.size.width-width)/2
        y = ((brownHeight - height)/2) + topHeight + barHeight + (349 * prop)
        
        var shareButton: UIImage = UIImage(named: "SendButton@3x.png")!
        sendYourIdea = UIImageView(image: shareButton)
        sendYourIdea.frame = CGRectMake(x, y, width, height)
        sendYourIdea.hidden = true
        sendYourIdea.userInteractionEnabled = true
        self.view.addSubview(sendYourIdea)
        
        let shareGesture = UITapGestureRecognizer(target: self, action:Selector("newIdeaTap:"))
        shareGesture.delegate = self
        sendYourIdea.addGestureRecognizer(shareGesture)
        
//      Cancel Send
        
        var cancelHeight:CGFloat = sizeRect.size.height - (topHeight + (349 * prop))
        var cancelProp:CGFloat = brownHeight/274
        
        width = verifyPosition(90.0 * buttonProp)
        height = verifyPosition(93.0 * buttonProp)
        x = (sizeRect.size.width-width)/2
        y = ((brownHeight - height)/2) + topHeight + barHeight + (349 * prop)
        
        var cancelButton: UIImage = UIImage(named: "CancelButton@3x.png")!
        cancelIdea = UIImageView(image: cancelButton)
        cancelIdea.frame = CGRectMake(x, y, width, height)
        cancelIdea.hidden = true
        cancelIdea.alpha = 0
        cancelIdea.userInteractionEnabled = true
        self.view.addSubview(cancelIdea)
        
        let cancelGesture = UITapGestureRecognizer(target: self, action:Selector("cancelIdeaTap:"))
        cancelGesture.delegate = self
        cancelIdea.addGestureRecognizer(cancelGesture)
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
        self.sendYourIdea.hidden = false
        self.tutorial.alpha = 0
        self.centerText()
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        
        if(maySendOrBack == true) {
            dismissView()
        }
        
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
    
    func newIdeaTap(recognizer: UITapGestureRecognizer) {
        
        if(maySendOrBack == true) {
            
            maySendOrBack = false
        
            var image = UIImage(named: "SendPressedButton@3x.png")!
            sendYourIdea.image = image
            sendYourIdea.frame.origin.y = sendYourIdea.frame.origin.y + 4
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.12, target: self, selector: Selector("upCloudAnimation"), userInfo: nil, repeats: false)
        }

    }
    
    func cancelIdeaTap(recognizer: UITapGestureRecognizer) {
        
        self.task.cancel()
        self.reloadView()
        
    }
    
    func upCloudAnimation() {
        
        var prop: CGFloat = sizeRect.size.width/375.0
        
        var image = UIImage(named: "SendButton@3x.png")!
        sendYourIdea.image = image
        sendYourIdea.frame.origin.y = sendYourIdea.frame.origin.y - 4
        
        var width = 71.0 * prop
        var height = 60.0 * prop
        var x = (sizeRect.size.width - width)/2
        var y = (((349 * prop) - height)/2) + topHeight + barHeight
        
        UIView.animateWithDuration(0.3, animations: {
        
            self.sendYourIdea.alpha = 0
                
        })
        
        UIView.animateWithDuration(0.2, animations: {
            
            //Zero
            self.textField.alpha = 0
            
            }, completion: {
                
                (value: Bool) in
                
                UIView.animateWithDuration(0.2, animations: {
                    
                    //Frist
                    self.happyCloudImageView.alpha = 1
                    
                    }, completion: {
                        
                        (value: Bool) in
                        
                        UIView.animateWithDuration(0.5, animations: {
                            
                            //Second
                            self.cloudImageView.frame = CGRectMake(x, y, width, height)
                            self.happyCloudImageView.frame = CGRectMake(0, 0, width, height)
                            
                            }, completion: {
                                
                                (value: Bool) in
                                
                                UIView.animateWithDuration(0.7, animations: {
                                    
                                    //Third
                                    var image:UIImage = UIImage(named: "HappyUpCloud2@3x.png")!
                                    self.happyCloudImageView.image = image
                                    self.cloudImageView.frame.origin.y = 0 - 100
                                    
                                    }, completion: {
                                        
                                        (value: Bool) in
                                        
                                        self.cancelIdea.hidden = false
                                        self.cloudImageView.alpha = 0
                                        
                                        UIView.animateWithDuration(0.3, animations: {
                                            
                                            //Fourth
                                            self.cancelIdea.alpha = 1
                                            self.loadSprite.alpha = 1
                                            
                                        }, completion: {
                                                
                                                (value: Bool) in
                                                
                                        })
                                        
                                        self.sendIdea()
                                        
                                })
                                
                        })
                        
                })
                
        })
        
    }
    
    func sendIdea() {
        
        let ideaText = textField.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let userEmail = useremail.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let userName = username.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        let urlpath = "http://104.131.156.49/wemagine/postIdea.php?email="+userEmail+"&name="+userName+"&idea="+ideaText
        
        var url = NSURL(string: urlpath)
        var session = NSURLSession.sharedSession()
        self.task = session.dataTaskWithURL(url!, completionHandler: {(data, response, error) in
            
            if let theData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                
                if(theData["Status"] as String == "ideaPostedSucessfully") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        UIView.animateWithDuration(0.3, animations: {
                            
                            self.loadSprite.alpha = 0
                            
                            }, completion: {
                                
                                (value: Bool) in
                                self.dismissView()
                        })
                        
                    }
                    
                } else if(theData["Status"] as String == "anErrorOcurred") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        () -> Void in
                        
                        UIView.animateWithDuration(0.3, animations: {
                            
                            //Fourth
                            self.loadSprite.alpha = 0
                            
                            }, completion: {
                                
                                (value: Bool) in
                                self.reloadView()
                        })
                        
                    }
                    
                }

            } else {
                
                println("Some error has occurred!")
                self.reloadView()
            }
            
        })
        
        self.task.resume()
        
    }
    
    func reloadView() {
        
        var image:UIImage = UIImage(named: "HappyUpCloud1@3x.png")!
        self.happyCloudImageView.image = image
        self.happyCloudImageView.alpha = 0
        self.loadSprite.alpha = 0
        self.cloudImageView.frame = CGRectMake(CloudX, CloudY, CloudW, CloudH)
        self.happyCloudImageView.frame = CGRectMake(0, 0, CloudW, CloudH)
        self.cancelIdea.hidden = true
        self.sendYourIdea.hidden = true
        self.sendYourIdea.alpha = 1
        
        maySendOrBack = true
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.tutorial.alpha = 1
            self.cancelIdea.alpha = 0
            self.textField.alpha = 1
            self.cloudImageView.alpha = 1
            
        })

    }
    
    func dismissView() {
        
        let secondViewController:ViewController = ViewController()
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func animateLoadIcon() {
        
        rotation += 0.1
        if (rotation >= CGFloat(M_PI*2)) {
            rotation = rotation - CGFloat(M_PI*2)
        }
        loadSprite.transform = CGAffineTransformMakeRotation(rotation)
        
    }
    
}