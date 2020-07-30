//
//  UIView.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UIView {
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


// MARK: - shadow border backgroundColor roundCorner
public extension UIView {
    /// Set shadow effect to the view.
    func ss_setShadow(color: UIColor = UIColor.black, opacity: Float = 0.5, offset: CGSize = CGSize(width: 0, height: 0)) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
    
    /// Set border to the view.
    func ss_setBorder(borderWidth: CGFloat, borderColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    /// Set border to the view.
    func ss_setBorder(borderWidth: CGFloat, borderColor: (Int, Int, Int, CGFloat)) {
        let color = UIColor(red: CGFloat(borderColor.0)/255.0,
                            green: CGFloat(borderColor.1)/255.0,
                            blue: CGFloat(borderColor.2)/255.0,
                            alpha: borderColor.3)
        self.ss_setBorder(borderWidth: borderWidth, borderColor: color)
    }
    
    /// Set background color
    func ss_setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    /// Set background color red,blue,green,alpha
    func ss_setBackgroundColor(_ red: Int, _ blue: Int, _ green: Int, _ alpha: CGFloat = 1.0) {
        self.backgroundColor = UIColor(red: CGFloat(red)/255.0,
                                       green: CGFloat(green)/255.0,
                                       blue: CGFloat(blue)/255.0,
                                       alpha: alpha)
    }
    
    /// Set round corners
    func ss_setRoundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}

// MARK: - screenshot
public extension UIView {
    /// Create a screenshot of the view of the specified frame.
    func ss_screenshot(croppingRect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(croppingRect.size, false, 1.0);
        if let context = UIGraphicsGetCurrentContext() {
            context.translateBy(x: -croppingRect.origin.x, y: -croppingRect.origin.y)
            self.setNeedsLayout()
            self.layoutIfNeeded()
            self.layer.render(in: context)
            let screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshotImage
        } else {
            return nil
        }
    }
    
    /// Screenshot of current view.
    @objc var ss_screenshot : UIImage? {
        return self.ss_screenshot(croppingRect: self.bounds)
    }
}

// MARK: - Shake animation
public extension UIView {
    enum SSShakeDirection {
        case horizontal
        case vertical
    }
    
    enum SSShakeAnimationType {
        case linear
        case easeIn
        case easeOut
        case easeInOut
    }
    
    func ss_shake(direction: SSShakeDirection = .horizontal, duration: TimeInterval = 1, animationType: SSShakeAnimationType = .easeOut, completion:(() -> Void)? = nil) {
        CATransaction.begin()
        let animation: CAKeyframeAnimation
        switch direction {
        case .horizontal:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        case .vertical:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        }
        
        switch animationType {
        case .linear:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        case .easeIn:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        case .easeOut:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        case .easeInOut:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        }
        
        CATransaction.setCompletionBlock(completion)
        animation.duration = duration
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }
}

// MARK: - Rotate animation
public extension UIView {
    enum SSAngleUnit {
        case degrees
        case radians
    }
    
    func ss_rotate(byAngle angle: CGFloat, ofType type: SSAngleUnit, animated: Bool = true, duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        let angleWithType = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration = animated ? duration : 0
        UIView.animate(withDuration: aDuration, delay: 0, options: .curveLinear, animations: { () -> Void in
            self.transform = self.transform.rotated(by: angleWithType)
        }, completion: completion)
    }
    
    func ss_rotate(toAngle angle: CGFloat, ofType type: SSAngleUnit, animated: Bool = true, duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
        let angleWithType = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration = animated ? duration : 0
        UIView.animate(withDuration: aDuration, animations: {
            self.transform = self.transform.concatenating(CGAffineTransform(rotationAngle: angleWithType))
        }, completion: completion)
    }
}

