//
//  UITextField.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension UITextField {
    /// 粘贴指定前n个字符
    ///
    /// - Parameters:
    ///   - range: 替换区间
    ///   - pastedString: 待粘贴的字符串
    ///   - prefixNumber: 最多粘贴的长度
    func ss_pastedPrefixNumberText(range: NSRange, pastedString: String, prefixNumber: Int) {
        guard prefixNumber <= pastedString.count else {
            return
        }
        let oldText = self.text ?? ""
        var cursorPositionIndex: Int = prefixNumber
        let newText = (oldText as NSString).replacingCharacters(in: range, with: String(pastedString.prefix(prefixNumber)))
        if let selectedRange = self.selectedTextRange {
            let oldCursorPositionIndex = self.offset(from: self.beginningOfDocument, to: selectedRange.start)
            cursorPositionIndex += oldCursorPositionIndex
        }
        self.text = newText
        if let newPosition = self.position(from: self.beginningOfDocument, in: UITextLayoutDirection.right, offset: cursorPositionIndex) {
            DispatchQueue.main.async {
                self.selectedTextRange = self.textRange(from: newPosition, to: newPosition)
            }
        }
    }
}
