//
//  MySharedIdeas.swift
//  WeMagine
//
//  Created by Victor Souza on 3/15/15.
//  Copyright (c) 2015 Victor Souza. All rights reserved.
//

import UIKit

class MySharedIdeas: UIViewController {
    
    var sizeRect = UIScreen.mainScreen().applicationFrame;
    let app = UIApplication.sharedApplication()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var prop: CGFloat = sizeRect.size.width/375.0
        var width: CGFloat
        var height: CGFloat
        var x: CGFloat
        var y: CGFloat
        var fontSize: CGFloat
        
        var barHeight:CGFloat = app.statusBarFrame.size.height
        
        var scrollView = UIScrollView(frame: CGRect(x: 0, y: barHeight, width: sizeRect.size.width, height: sizeRect.size.height))
        
        self.view = scrollView
        
        scrollView.scrollEnabled = true
        scrollView.contentSize = CGSize(width: sizeRect.size.width, height: 3 * sizeRect.size.height)
     
        
        
    }

}
