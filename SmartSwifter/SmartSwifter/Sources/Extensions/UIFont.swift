//
//  UIFont.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UIFont {
    /// PingFang SC
    static func ss_pingFangSC(size: CGFloat) -> UIFont?{
        return  UIFont(name: "PingFang SC", size: size)
    }
    
    /// PingFangSC-Medium
    static func ss_pingFangSCMedium(size: CGFloat) -> UIFont?{
        return  UIFont(name: "PingFangSC-Medium", size: size)
    }
    
    /// PingFangSC-Bold
    static func ss_pingFangSCBold(size: CGFloat) -> UIFont?{
        return  UIFont(name: "PingFangSC-Bold", size: size)
    }
    
    /// PingFangSC-Semibold
    static func ss_pingFangSCSemibold(size: CGFloat) -> UIFont? {
        return  UIFont(name: "PingFangSC-Semibold", size: size)
    }
    
    /// PingFangSC-Light
    static func ss_pingFangSCLight(size: CGFloat) -> UIFont? {
        return  UIFont(name: "PingFangSC-Light", size: size)
    }
}
