//
//  SSMeasurement.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public class SSMeasurement {
    /// Measure the UITextView height by specified width
    ///
    /// - Parameters:
    ///   - textView: UITextView
    ///   - textViewWidth: Specified width
    /// - Returns: TextView height
    public static func measureTextViewHeightFrom(textView: UITextView, textViewWidth: CGFloat) -> CGFloat {
        if let normalText = textView.text, let font = textView.font {
            let lineFragmentPading = textView.textContainer.lineFragmentPadding
            let textContainerInset = textView.textContainerInset
            let topOffset = textContainerInset.top
            let bottomOffset = textContainerInset.bottom
            let leadingOffset = textContainerInset.left
            let trailingOffset = textContainerInset.right
            let textContentWidth = textViewWidth-leadingOffset-trailingOffset-lineFragmentPading*2
            let size = CGSize(width: textContentWidth, height: 1000)
            let attributes = [NSAttributedString.Key.font: font]
            let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil).size
            
            return  CGFloat(ceilf(Float(stringSize.height)))+topOffset+bottomOffset
        }
        return CGFloat(0)
    }
    

    /// Measure the UILabel height by specified width
    ///
    /// - Parameters:
    ///   - label: UILabel
    ///   - labelWidth: Specified width
    /// - Returns: Label height
    public static func measureLabelHeightFrom(label: UILabel, labelWidth: CGFloat) -> CGFloat {
        if let text = label.text, let font = label.font {
            let topOffset = CGFloat(0)
            let bottomOffset = CGFloat(0)
            let textContentWidth = labelWidth
            let size = CGSize(width: textContentWidth, height: 1000)
            let attributes = [NSAttributedString.Key.font: font]
            let stringSize = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil).size
            return  CGFloat(ceilf(Float(stringSize.height)))+topOffset+bottomOffset
        }
        return CGFloat(0)
    }
    
    

    /// Measure the UILabel width by text
    ///
    /// - Parameter label: UILabel
    /// - Returns: Label width
    public static func measureLabelWidth(label: UILabel) -> CGFloat {
        if let text = label.text, let font = label.font {
            let size = CGSize(width: 375, height: 1000)
            let attributes = [NSAttributedString.Key.font: font]
            let stringSize = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil).size
            return  CGFloat(ceilf(Float(stringSize.width)))
        }
        return CGFloat(0)
    }
}
