# KGBadgeView - Get an awesome badge view :collision: :+1:

[![Build Status](https://travis-ci.org/Gypsyan/KGBadgeView.svg?branch=master)](https://travis-ci.org/Gypsyan/KGBadgeView)
[![Swift3+ Compatible](https://img.shields.io/badge/KGBadgeView-Swift3+-brightgreen.svg)](https://img.shields.io/badge/KGBadgeView-Swift3+-brightgreen.svg)
[![CocoaPods](https://img.shields.io/cocoapods/dt/KGBadgeView.svg)](https://cocoapods.org/pods/KGBadgeView)

A quick way to add badge icon on the UIView elements.

![Alt Text](https://github.com/Gypsyan/KGBadgeView/raw/master/images/images.gif)


## Cocoapods

```
use_frameworks!

target 'yourApp' do
    platform :ios, '9.0'
	pod 'KGBadgeView', '~> 1.0'
end
```

## How to ??

### Initialize 

  ```
   let kgBadgeObj = KGBadgeView()
   kgBadgeObj.initWithView(view: yourViewElement)
  ```

### Set Badge

```
kgBadgeObj.setCount(2)
kgBadgeObj.showCount()
```

### Set Font

```
kgBadgeObj.setFont(fontObj: UIFont(name: "HelveticaNeue", size: 20)!)
```

### Set Size

```
kgBadgeObj.setSize(width: 25, height: 25)
```

### Set BackGround color

```
kgBadgeObj.setBackgroundColor(color: UIColor.red)
```

### Set Text color

```
kgBadgeObj.setTextColor(color: UIColor.white)
```

### Set Position 

To set position for a badge use teh following 

```
 kgBadgeObj.setPostion(xAxis: 110, yAxis: -10)
```


### Set Animations

```
 kgBadgeObj.showAnimation(type: KGBadgeView.AnimType.shakeAnim)
```
Different animations,

* KGBadgeView.AnimType.defaultAnim
* KGBadgeView.AnimType.shakeAnim
* KGBadgeView.AnimType.blinkAnim
* KGBadgeView.AnimType.swingAnim
* KGBadgeView.AnimType.pulseAnim


## Support 

 For support raise an issue [here](https://github.com/Gypsyan/KGBadgeView/issues).


Please feel free to contribute 💪✌️💯