//
//  UIScrollView.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UIScrollView {
    /// 内容截图
    var ss_screenshotImage: UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(contentSize)
        
        let formerContentOffset = contentOffset
        let formerFrame = frame
        self.contentOffset = .zero
        self.frame = CGRect(origin: CGPoint.zero, size: contentSize)
        
        UIGraphicsBeginImageContextWithOptions(contentSize, false, UIScreen.main.scale)
        if let currentContext = UIGraphicsGetCurrentContext() {
            self.layer.render(in: currentContext)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        self.contentOffset = formerContentOffset
        self.frame = formerFrame
        
        return image
    }
}
