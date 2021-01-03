//
//  UIFont+Helpers.swift
//  DeclarePlus
//
//  Created by Hongyi Zheng on 2018/7/25.
//  Copyright © 2018年 Hongyi Zheng. All rights reserved.
//

import Foundation

extension UIFont { // DIN_Pro
    
    class func mediumDINPro(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "DINPro-Medium", size: size)
    }
    
    class func boldDINPro(size: CGFloat) -> UIFont? {
        return UIFont.init(name: "DINPro-Bold", size: size)
    }

}

extension UIFont { // TC
    class func lightPingFangTC(size: CGFloat) -> UIFont {
        
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangTC-Light", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func regularPingFangTC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangTC-Regular", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func thinPingFangTC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangTC-Thin", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func mediumPingFangTC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangTC-Medium", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func boldPingFangTC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangTC-Semibold", size: size)!
        } else {
            return UIFont.boldSystemFont(ofSize:size)
        }
    }
}

extension UIFont { // SC
    class func lightPingFangSC(size: CGFloat) -> UIFont {
        
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangSC-Light", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func regularPingFangSC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangSC-Regular", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func thinPingFangSC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangSC-Thin", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func mediumPingFangSC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangSC-Medium", size: size)!
        } else {
            return UIFont.systemFont(ofSize:size)
        }
    }
    
    class func boldPingFangSC(size: CGFloat) -> UIFont {
        if NSString.init(string: UIDevice.current.systemVersion).floatValue >= 9 {
            return UIFont.init(name: "PingFangSC-Semibold", size: size)!
        } else {
            return UIFont.boldSystemFont(ofSize:size)
        }
    }
}
