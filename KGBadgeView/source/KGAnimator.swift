//
//  KGAnimator.swift
//  KGBadgeView
//
//  Created by Anantha Krishnan K G on 26/12/17.
//  Copyright © 2017 Ananth. All rights reserved.
//

import UIKit

class KGAnimator: NSObject {
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    public func get(onViews: (UIView,UIView), type: String) {
        switch type {
        case "shake":
            shakeAnimator(onViews: onViews)
            break
        case "blink":
            blinkAnimator(onViews: onViews)
            break
        case "swing":
            swingAnimator(onViews: onViews)
            break
        case "pulse":
            pulseAnimator(onViews: onViews)
            break
        default:
            defaultAnimator(onViews: onViews)
            break
        }
    }

    private func blinkAnimator(onViews: (UIView,UIView) ){
        print("blinkAnimator")
        let blinkDur:Double = 0.1;
        let blinkAlp:CGFloat = 0.1;
        setAlpha(alphaValue: blinkAlp, onView: onViews)
        UIView.animate(withDuration: blinkDur, animations: {
            self.setAlpha(alphaValue: 1, onView: onViews)
        }) { (onComplete) in
            UIView.animate(withDuration: blinkDur, animations: {
                self.setAlpha(alphaValue: blinkAlp, onView: onViews)
            }, completion: { (onComplete) in
                self.setAlpha(alphaValue: 1, onView: onViews)
            })
        }
        
    }
    
    private func pulseAnimator(onViews: (UIView,UIView) ){
        print("pulseAnimator")
        
        UIView.animate(withDuration: 0.5, animations: {
            self.setTransform(transfomrValue: (1.1,1.1), onViews: onViews)
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.setTransform(transfomrValue: (1,1), onViews: onViews)
            }, completion: { (finished) in
                
            })
        }
        
    }
    
    
    private func shakeAnimator(onViews: (UIView,UIView)) {
        print("shakeAnimator")
        let dist:CGFloat = 10;
        self.changeframe(xVlaue: -dist, duration: 0.15, onViews: onViews) { (finished) in
            
            self.changeframe(xVlaue: dist*2, duration: 0.15, onViews: onViews) { (finished) in
                
                self.changeframe(xVlaue: -(dist*2), duration: 0.15, onViews: onViews) { (finished) in
                    
                    self.changeframe(xVlaue: dist, duration: 0.15, onViews: onViews) { (finished) in
                        print("finsihed shakeAnimator")
                    }
                }
            }
        }
    }
    
    private func swingAnimator(onViews: (UIView,UIView)) {
         print("swingAnimator")
        let dist:Double = 15;
        let dur:TimeInterval = 0.20;
        self.addRotation(rVlaue: dist, duration: dur, onViews: onViews) { (finished) in
            self.addRotation(rVlaue: -dist, duration: dur, onViews: onViews) { (finished) in
                self.addRotation(rVlaue: dist/2, duration: dur, onViews: onViews) { (finished) in
                    self.addRotation(rVlaue: -dist/2, duration: dur, onViews: onViews) { (finished) in
                        self.addRotation(rVlaue: 0, duration: dur, onViews: onViews) { (finished) in
                             print("finsihed swingAnimator")
                        }
                    }
                }
            }
        }
    }
    private func defaultAnimator(onViews: (UIView,UIView)) {
         print("defaultAnimator")
        let dist:Double = 3;
        let dur:TimeInterval = 0.12;
        
        UIView.animate(withDuration: dur, animations: {
            let customTransf = self.convertDegToRad(angle: dist)
            let rotate = CGAffineTransform(rotationAngle: CGFloat(customTransf))
            let stretchAndRotate = rotate.scaledBy(x: 0.95 , y: 0.95)
            
            onViews.1.transform = stretchAndRotate
            onViews.0.transform = stretchAndRotate
            
            UIView.animate(withDuration: dur, animations: {
                let customTransf = self.convertDegToRad(angle: dist)
                let rotate = CGAffineTransform(rotationAngle: CGFloat(customTransf))
                let stretchAndRotate = rotate.scaledBy(x: 1.05 , y: 1.05)
                
                onViews.1.transform = stretchAndRotate
                onViews.0.transform = stretchAndRotate
                
                
            }) { (finished) in
                
                self.addRotation(rVlaue: dist*2, duration: dur, onViews: onViews, completionHandler: { (finished) in
                    self.addRotation(rVlaue: -dist*2, duration: dur, onViews: onViews, completionHandler: { (finished) in
                        
                        self.addRotation(rVlaue: dist*2, duration: dur, onViews: onViews, completionHandler: { (finished) in
                            
                            self.addRotation(rVlaue: -dist*2, duration: dur, onViews: onViews, completionHandler: { (finished) in
                                
                                UIView.animate(withDuration: dur, animations: {
                                    
                                    let customTransf = self.convertDegToRad(angle: 0)
                                    let rotate = CGAffineTransform(rotationAngle: CGFloat(customTransf))
                                    let stretchAndRotate = rotate.scaledBy(x: 1.0 , y: 1.0)
                                    
                                    onViews.1.transform = stretchAndRotate
                                    onViews.0.transform = stretchAndRotate
                                }, completion: { (finished) in
                                    print("finsihed defaultAnimator")
                                })
                                
                            })
                        })
                    })
                    
                })
            }
            

        }) { (finished) in
            print("finished")
        }
    }
    
    private func setAlpha(alphaValue: CGFloat, onView: (UIView,UIView)){
        onView.0.alpha = alphaValue
        onView.1.alpha = alphaValue
    }
    
    private func setTransform(transfomrValue:(CGFloat,CGFloat) , onViews: (UIView,UIView)){
        onViews.0.transform = CGAffineTransform(scaleX: transfomrValue.0, y: transfomrValue.1)
        onViews.1.transform = CGAffineTransform(scaleX: transfomrValue.0, y: transfomrValue.1)
    }
    
    private func changeframe(xVlaue:CGFloat , duration: TimeInterval , onViews: (UIView,UIView), completionHandler:@escaping CompletionHandler){
        
        let x0CValue = onViews.0.frame.origin.x + xVlaue
        let x1CValue = onViews.1.frame.origin.x + xVlaue
        
        var v0Frame = onViews.0.frame
        var v1Frame = onViews.1.frame
        
        UIView.animate(withDuration: duration, animations: {
            
            v0Frame.origin.x = x0CValue
            v1Frame.origin.x = x1CValue
            onViews.0.frame = v0Frame
            onViews.1.frame = v1Frame
        }) { (finished) in
            
            completionHandler(true)
        }
    }
    
    private func addRotation(rVlaue:Double , duration: TimeInterval , onViews: (UIView,UIView), completionHandler:@escaping CompletionHandler) {
        
        UIView.animate(withDuration: duration, animations: {
            
            let customTransf = self.convertDegToRad(angle: rVlaue)
            let rotate = CGAffineTransform(rotationAngle: CGFloat(customTransf))
            let stretchAndRotate = rotate.scaledBy(x: 1.0 , y: 1.0)
            
            onViews.1.transform = stretchAndRotate
            onViews.0.transform = stretchAndRotate
            
            
        }) { (finished) in
            completionHandler(true)
        }
    }
    
    private func convertDegToRad(angle: Double) -> Double {
        return angle*Double.pi/180
    }

        
    
}
