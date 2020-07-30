//
//  UIViewController.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - 打开链接相关
public extension UIViewController {
    /// 打开应用设置页
    func ss_openSystemSetting() {
        self.ss_openURL(UIApplication.openSettingsURLString)
    }
    
    /// 内置浏览器打开网页
    func ss_openSafair(url: String, failed: ((String) -> Void)? = nil) {
        var urlString = url
        if !url.contains("http") {
            urlString = "http://\(url)"
        }
        guard let URL = URL(string: urlString), UIApplication.shared.canOpenURL(URL) else {
            failed?("Application can not open url!")
            return
        }
        let safariVC = SFSafariViewController(url: URL)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    func ss_openURL(_ url: String, _ failed: ((String) -> Void)? = nil) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
            guard let url = URL(string: url) else {
                failed?("URL init failed")
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: { (isSuccess) in
                        if !isSuccess {
                            failed?("Application open url failed!")
                        }
                    })
                } else {
                    UIApplication.shared.openURL(url)
                }
            } else {
                failed?("Application can not open url!")
            }
        })
    }
}


public extension UIViewController {
    /// SafeAreaTopInset 顶部安全区域偏移量
   var ss_SafeAreaTopInset: CGFloat {
        return UIDevice.current.ss_isFullSrceen ? CGFloat(44) : CGFloat(20)
    }
    
    /// SafeAreaBottomInset 底部安全区域偏移量
    var ss_SafeAreaBottomInset: CGFloat {
        return UIDevice.current.ss_isFullSrceen ? CGFloat(34) : CGFloat(0)
    }
    
    /// NavigationBar Height
    var ss_NavigationBarHeight: CGFloat {
        return UIDevice.current.ss_isFullSrceen ? CGFloat(88) : CGFloat(64)
    }
    
    /// TabBar Height
    var ss_TabBarHeight: CGFloat {
        return UIDevice.current.ss_isFullSrceen ? CGFloat(83) : CGFloat(49)
    }
    
    /// Screen Width
    var ss_ScreenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /// Screen Height
    var ss_ScreenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
