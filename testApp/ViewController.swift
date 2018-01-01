//
//  ViewController.swift
//  testApp
//
//  Created by Anantha Krishnan K G on 25/12/17.
//  Copyright © 2017 Ananth. All rights reserved.
//

import UIKit
import KGBadgeView

class ViewController: UIViewController,UINavigationControllerDelegate,UITabBarDelegate {
  
    
    @IBOutlet var customView: UIView!
    @IBOutlet var tabButton1: UITabBarItem!
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var iconsView: UIImageView!
    @IBOutlet var customButton: UIButton!
    let kgBadgeObj1 = KGBadgeView()
    let kgBadgeObj2 = KGBadgeView()
    let kgBadgeObj3 = KGBadgeView()
    let kgBadgeObj4 = KGBadgeView()
    let kgBadgeObj5 = KGBadgeView()

    var i = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tabBar.delegate = self
        
        kgBadgeObj1.initWithView(view: iconsView)
        kgBadgeObj1.setCount(300)
        kgBadgeObj1.showCount()
        kgBadgeObj1.showAnimation(type: KGBadgeView.AnimType.shakeAnim)
        
        //customView.layer.cornerRadius = customView.frame.size.width/0.2
        kgBadgeObj2.initWithAnyObject(customObject: customView)
        kgBadgeObj2.setCount(34)
        kgBadgeObj2.showCount()
        

        let interactionViews = self.tabBar.subviews.filter({$0.isUserInteractionEnabled})
        let g = interactionViews.sorted(by: {$0.frame.minX < $1.frame.minX})
        
        
        kgBadgeObj3.initWithView(view: g[0])
        kgBadgeObj3.setCount(56)
        kgBadgeObj3.setFont(fontObj: UIFont(name: "HelveticaNeue", size: 20)!)
        kgBadgeObj3.setSize(width: 25, height: 25)
        kgBadgeObj3.showCount()
        kgBadgeObj3.setBackgroundColor(color: UIColor.clear)
        kgBadgeObj3.setTextColor(color: UIColor.red)
        kgBadgeObj3.setPostion(xAxis: 110, yAxis: -10)
        kgBadgeObj3.showAnimation(type: KGBadgeView.AnimType.shakeAnim)
 
        
        
        kgBadgeObj4.initWithView(view: customButton)
        kgBadgeObj4.setCount(20)
        kgBadgeObj4.showCount()
        let button:UIButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width:30 , height: 30))

        button.addTarget(self, action: #selector(dd(_:)), for: .touchUpInside)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.setTitle("gg", for: .normal)
        kgBadgeObj5.initWithAnyObject(customObject: button)
        kgBadgeObj5.setCount(34)
        kgBadgeObj5.showCount()
       // tt.showAnimation(type: KGBadgeView.AnimType.defaultAnim)
        navigationItem.leftBarButtonItem =  UIBarButtonItem(customView: button)
        //self.navigationItem.rightBarButtonItem  = button1
        
        
   
    }

    @IBAction func dd(_ sender: Any) {
        i+=1;
        kgBadgeObj5.setCount(i)
        kgBadgeObj5.showCount()
        kgBadgeObj5.showAnimation(type: KGBadgeView.AnimType.shakeAnim)
        kgBadgeObj3.showAnimation(type: KGBadgeView.AnimType.defaultAnim)
        kgBadgeObj1.showAnimation(type: KGBadgeView.AnimType.defaultAnim)
        kgBadgeObj2.showAnimation(type: KGBadgeView.AnimType.pulseAnim)


        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UITabBarController {
    func orderedTabBarItemViews() -> [UIView] {
        let interactionViews = tabBar.subviews.filter({$0.isUserInteractionEnabled})
        return interactionViews.sorted(by: {$0.frame.minX < $1.frame.minX})
    }
}

