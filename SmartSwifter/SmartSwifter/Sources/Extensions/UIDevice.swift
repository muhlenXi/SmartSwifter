//
//  UIDevice.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UIDevice {
    /// 是否是全面屏
    var ss_isFullSrceen: Bool {
        get {
            if #available(iOS 11, *) {
                let window = UIApplication.shared.keyWindow
                if let safeInsetTop = window?.safeAreaInsets.top {
                    return safeInsetTop > 20.0
                }
                return false
            }
            return false
        }
    }
    
    /// 当前设备时间是否是12小时制
    var ss_is12HourMode: Bool {
        if let formatStringForHours = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current) {
            return formatStringForHours.contains("a")
        }
        return false
    }
}
