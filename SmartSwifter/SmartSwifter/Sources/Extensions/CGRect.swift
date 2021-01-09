//
//  CGRect.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import UIKit

public extension CGRect {
    /// origin x
    var ss_x: CGFloat {
        return self.origin.x
    }
    
    /// origin.y
    var ss_y: CGFloat {
        return self.origin.y
    }
    
    /// size width
    var ss_width: CGFloat {
        return self.size.width
    }
    
    /// size height
    var ss_height: CGFloat {
        return self.size.height
    }
    
    /// left top point
    var ss_leftTopPoint: CGPoint {
        return CGPoint(x: self.ss_x, y: self.ss_y)
    }
    
    /// left bottom point
    var ss_leftBottomPoint: CGPoint {
        return CGPoint(x: self.ss_x, y: self.ss_y + self.ss_height)
    }
    
    /// right top point
    var ss_rightTopPoint: CGPoint {
        return CGPoint(x: self.ss_x + self.ss_width, y: self.ss_y)
    }
    
    /// right bottom point
    var ss_rightBottomPoint: CGPoint {
        return CGPoint(x: self.ss_x + self.ss_width, y: self.ss_y + self.ss_height)
    }
}
