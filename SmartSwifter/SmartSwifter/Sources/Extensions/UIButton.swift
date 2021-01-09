//
//  UIButton.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit


public extension UIButton {
    enum SSButtonEdgeInsetsStyle: Int {
        /// image在上，label在下
        case imageUpLabelDown
        /// image在下，label在上
        case imageDownLabelUp
        /// image在左，label在右
        case imageLeftLabelRight
        /// image在右，label在左
        case imageRightLabelLeft
    }
    
    func ss_layoutWithEdgeInsetsStyle(style: SSButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //  imageView和titleLabel的宽、高
        let imgW = self.imageView?.frame.size.width ?? 0.0
        let imgH = self.imageView?.frame.size.height ?? 0.0
        let orgLabW = self.titleLabel?.frame.size.width ?? 0.0
        let orgLabH = self.titleLabel?.frame.size.height ?? 0.0
        
        let trueSize = self.titleLabel?.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let trueLabW = trueSize?.width ?? 0.0
        
        //image中心移动的x距离
        let imageOffsetX = orgLabW / 2.0
        //image中心移动的y距离
        let imageOffsetY = orgLabH / 2.0 + imageTitleSpace / 2.0
        //label左边缘移动的x距离
        let labelOffsetX1 = imgW / 2.0 - orgLabW / 2.0 + trueLabW / 2.0
        //label右边缘移动的x距离
        let labelOffsetX2 = imgW / 2.0 + orgLabW / 2.0 - trueLabW / 2.0
        //label中心移动的y距离
        let labelOffsetY = imgH / 2.0 + imageTitleSpace / 2.0
        
        //  声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets: UIEdgeInsets = .zero
        var labelEdgeInsets: UIEdgeInsets = .zero
        
        //  根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch (style) {
        case .imageUpLabelDown:
            imageEdgeInsets = UIEdgeInsets(top: -imageOffsetY, left: imageOffsetX, bottom: imageOffsetY, right: -imageOffsetX)
            labelEdgeInsets = UIEdgeInsets(top: labelOffsetY, left: -labelOffsetX1, bottom: -labelOffsetY, right: labelOffsetX2)
            
        case .imageDownLabelUp:
            imageEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: imageOffsetX, bottom: -imageOffsetY, right: -imageOffsetX)
            labelEdgeInsets = UIEdgeInsets(top: -labelOffsetY, left: -labelOffsetX1, bottom: labelOffsetY, right: labelOffsetX2)
            
        case .imageLeftLabelRight:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageTitleSpace / 2.0, bottom: 0.0, right: imageTitleSpace / 2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: imageTitleSpace / 2.0, bottom: 0.0, right: -imageTitleSpace / 2.0)
            
        case .imageRightLabelLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: orgLabW + imageTitleSpace / 2.0, bottom: 0.0, right: -(orgLabW + imageTitleSpace / 2.0))
            labelEdgeInsets = UIEdgeInsets(top: 0.0, left: -(imgW + imageTitleSpace / 2.0), bottom: 0.0, right: imgW + imageTitleSpace / 2.0)
        }
        
        self.imageEdgeInsets = imageEdgeInsets
        self.titleEdgeInsets = labelEdgeInsets
    }
}



