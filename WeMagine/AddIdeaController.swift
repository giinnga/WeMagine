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
    var sendYourIdea: UIImageView = UIImageView()
    
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
        var topHeight:CGFloat = 44.0
        
//        Top rectangle
        
        width = 375.0 * prop
        height = topHeight + barHeight
        x = 0.0
        y = 0.0
        
        var topMenuRectangle:UIView = UIView(frame: CGRectMake(x, y, width, height))
        topMenuRectangle.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(topMenuRectangle)
        
        width = 63.0
        height = 44.0
        x = self.sizeRect.width - width
        y = barHeight
        
        var lampIcon:UIImage = UIImage(named: "LampIcon@3x.png")!
        var lampIconView:UIImageView = UIImageView(image: lampIcon)
        lampIconView.frame = CGRectMake(x, y, width, height)
        lampIconView.userInteractionEnabled = true
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
        
//      Cloud
        
        var totalHeight: CGFloat = (274.0 * prop) + (70.0 * prop) + (107.0 * prop)
        var fullHeight: CGFloat = sizeRect.size.height - topHeight
        
        width = verifyPosition(325.0 * prop)
        height = verifyPosition(274.0 * prop)
        x = verifyPosition((sizeRect.size.width - width)/2)
        y = verifyPosition((349*prop - height)/2 + topHeight + barHeight)
        
        var cloudImage: UIImage = UIImage(named: "Cloud@3x.png")!
        var cloudImageView: UIImageView = UIImageView(image: cloudImage)
        cloudImageView.frame = CGRectMake(x,y,width,height)
        cloudImageView.userInteractionEnabled = true
        self.view.addSubview(cloudImageView)
        
        
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
        
//        Send your idea
        
        var shareButton: UIImage = UIImage(named: "HappyCloudButton@3x.png")!
        sendYourIdea = UIImageView(image: shareButton)
        sendYourIdea.frame = CGRect(x: sizeRect.size.width/2.8, y: 0.825 * sizeRect.size.height, width: 10, height: 10)
        sendYourIdea.sizeToFit()
        sendYourIdea.hidden = true
        self.view.addSubview(sendYourIdea)
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
        self.centerText()
    }
    
    func newIdea(recognizer: UITapGestureRecognizer) {
        
        let secondViewController:ViewController = ViewController()
        self.dismissViewControllerAnimated(true, completion: nil)
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