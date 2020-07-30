//
//  UIImage.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UIImage {
    /// 水印方式枚举
    enum SSWaterMarkMode {
        /// 左上
        case topLeft
        /// 右下
        case topRight
        /// 左下
        case bottomLeft
        /// 右下
        case bottomRight
        /// 平铺
        case tiled
    }
    
    /// 添加图片水印
    func ss_makeWaterMarkedImage(waterMarkImage: UIImage, mode: SSWaterMarkMode = .bottomRight,
                              margin: CGPoint = CGPoint(x: 20, y: 20), alpha:CGFloat = 1.0) -> UIImage? {
        
        var markedFrames = [CGRect]()
        let imageSize = self.size
        
        let waterMarkImageWidth = waterMarkImage.size.width
        let waterMarkImageheight = waterMarkImage.size.height
        
        switch mode {
        case .topLeft:
            markedFrames.append(CGRect(x: margin.x, y: margin.y, width: waterMarkImageWidth, height: waterMarkImageheight))
        case .topRight:
            markedFrames.append(CGRect(x: imageSize.width - waterMarkImageWidth - margin.x, y: margin.y, width: waterMarkImageWidth, height: waterMarkImageheight))
        case .bottomLeft:
            markedFrames.append(CGRect(x: margin.x, y: imageSize.height - waterMarkImageheight - margin.y, width: waterMarkImageWidth, height: waterMarkImageheight))
        case .bottomRight:
            markedFrames.append(CGRect(x: imageSize.width - waterMarkImageWidth - margin.x, y: imageSize.height - waterMarkImageheight - margin.y, width: waterMarkImageWidth, height: waterMarkImageheight))
        case .tiled:
            let imageScan = waterMarkImage.size.width / waterMarkImage.size.height
            let waterMarkImageWidth = imageSize.width / 3
            let waterMarkImageheight = waterMarkImageWidth / imageScan
            
            for x in 0..<3 {
                for y in 0..<Int(ceil(imageSize.height/waterMarkImageheight)) {
                    markedFrames.append(CGRect(x: waterMarkImageWidth*CGFloat(x), y: waterMarkImageheight*CGFloat(y), width: waterMarkImageWidth, height: waterMarkImageheight))
                }
            }
            break
        }
        
        // 开始给图片添加图片水印
        UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        for frame in markedFrames {
            waterMarkImage.draw(in: frame, blendMode: .normal, alpha: alpha)
        }
        
        let waterMarkedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return waterMarkedImage
    }
}


