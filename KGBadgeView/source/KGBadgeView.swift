//
//  KGBadgeView.swift
//  KGBadgeView
//
//  Created by Anantha Krishnan K G on 25/12/17.
//  Copyright © 2017 Ananth. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore
open class KGBadgeView: NSObject {
    
    // Constants
    public let defaultDiameter:CGFloat = 40;
    private var superView = UIView()
    private var customView = UIView()
    private var viewFrame = CGRect()
    private var backgroundColor = UIColor.red
    private var textLabel = UILabel()
    private var textColor = UIColor.white
    private var fontType = UIFont(name: "HelveticaNeue", size: 20);
    private var countValue = 0
    
    public struct AnimType {
        public static let defaultAnim = "deafult"
        public static let shakeAnim = "shake"
        public static let blinkAnim = "blink"
        public static let swingAnim = "swing"
        public static let pulseAnim = "pulse"
    }
 
    //Initializers

    
    public func initWithView(view :UIView ) {
        superView = view
        createView(view: view)
    }
    
    public func initWithAnyObject (customObject : Any ){
        self.initWithView(view: customObject as! UIView)
    }
    
    public func setCount (_ count: Int) {
        countValue = count
        textLabel.text = String(countValue)
        textSize()
    }
    
    public func setPostion(xAxis: CGFloat, yAxis: CGFloat) {
        
        var frame:CGRect = customView.frame;
        frame.origin.x = xAxis
        frame.origin.y = yAxis
        customView.frame = frame;
        textLabel.frame = frame
    }
    
    public func setSize(width: CGFloat, height: CGFloat) {
        
        var frame:CGRect = customView.frame;
        frame.size.width = width
        frame.size.height = height
        customView.frame = frame;
        textLabel.frame = frame
    }
    
    public func setFont(fontObj: UIFont) {
        textLabel.font = fontObj
        self.fontType = fontObj
    }
    
    public func setBackgroundColor(color: UIColor) {
        customView.backgroundColor = color
        backgroundColor = color
    }
    
    public func setTextColor(color: UIColor) {
        textLabel.textColor = color
        textColor = color
    }
    
    public func showCount () {
        
        if (countValue > 0) {
            superView.addSubview(customView)
            superView.addSubview(textLabel)
            superView.bringSubview(toFront: customView)
            superView.bringSubview(toFront: textLabel)
        }
    }
    
    public func showAnimation(type: String) {
        
        KGAnimator().get(onViews: (customView,textLabel), type: type)
    }
    
    private func createView(view: Any) {
        if #available(iOS 12.0, *) {
            viewFrame = (view as AnyObject).frame
        } else {
            // Fallback on earlier versions
        };
        customView = UIView(frame: CGRect(x: viewFrame.size.width - defaultDiameter/2, y:  -(defaultDiameter/2), width: defaultDiameter, height: defaultDiameter))
        customView.isUserInteractionEnabled = false
        customView.backgroundColor = backgroundColor
        customView.layer.cornerRadius = customView.frame.size.width/2.0;

        textLabel = UILabel(frame: customView.frame)
        textLabel.layer.cornerRadius = textLabel.frame.size.width/2.0
        textLabel.isUserInteractionEnabled = false
        textLabel.textAlignment = .center
        textLabel.textColor = textColor
        textLabel.backgroundColor = UIColor.clear
        textLabel.font = fontType
    }
    

    func textSize()  {
        var orderOfMagnitude = log10(Double(countValue))
        orderOfMagnitude = (orderOfMagnitude >= 2) ? orderOfMagnitude : 1;
        var frame:CGRect = customView.frame;
        frame.size.width = customView.frame.size.width * (CGFloat( 1 + 0.3 * (orderOfMagnitude - 1)));
        //frame.origin.x = viewFrame.origin.x - (frame.size.width - viewFrame.size.width) / 2;
        
        customView.frame = frame;
        textLabel.frame = frame

    }
}

