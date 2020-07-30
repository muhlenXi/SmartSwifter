//
//  NSMutableAttributedString.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension NSMutableAttributedString {
    
    /// 创建属性字符串
    ///
    /// - Parameters:
    ///   - string: 待创建的字符串
    ///   - stringColor: 字符串颜色
    ///   - stringFont: 字符串字体
    ///   - subStrings: 待处理子串
    ///   - subStringColor: 待处理子串颜色
    ///   - subStringFont: 待处理子串字体
    /// - Returns: 生成的属性字符串
    static func ss_create(string: String,
         stringColor: UIColor,
         stringFont: UIFont = UIFont.systemFont(ofSize: 15),
         subStrings: [String]? = nil,
         subStringColor: UIColor?,
         subStringFont: UIFont = UIFont.systemFont(ofSize: 15))  -> NSMutableAttributedString {
        
        let attribute = [NSAttributedString.Key.foregroundColor: stringColor,
                         NSAttributedString.Key.font: stringFont]
        let attributedString = NSMutableAttributedString(string: string, attributes: attribute)
        if let subStrings = subStrings, let subStringColor = subStringColor {
            let string = attributedString.string
            for subString in subStrings {
                let ranges = string.ss_rangeOfSubString(subString)
                for range in ranges {
                    let subAttribute = [NSAttributedString.Key.foregroundColor: subStringColor,
                                        NSAttributedString.Key.font: subStringFont]
                    attributedString.setAttributes(subAttribute, range: range)
                }
            }
        }
        return attributedString
    }
}

public extension String {
    /// 获取输入子字符串在当前字符串的所有位置范围数组
    ///
    /// - Parameter subStr: 输入要查找的子字符串
    /// - Returns: 包含所有位置范围的数组
    func ss_rangeOfSubString(_ subStr: String) -> Array<NSRange> {
        guard subStr.count > 0, self.contains(subStr) else {
            return []
        }
        var rangeArray = [NSRange]()
        var index: Int = 0
        var ocStr = NSString(string: self)
        while ocStr.contains(subStr) {
            let range = ocStr.range(of: subStr)
            rangeArray.append(NSMakeRange(index + range.location, subStr.count))
            index += NSMaxRange(range)
            ocStr = ocStr.substring(from: NSMaxRange(range)) as NSString
        }
        return rangeArray
    }
}
