//
//  DispatchQueue.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/31.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    static var ss_userInteractive: DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var ss_userInitiated: DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var ss_utility: DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var ss_background: DispatchQueue { return DispatchQueue.global(qos: .background) }
    
    func ss_after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
}
