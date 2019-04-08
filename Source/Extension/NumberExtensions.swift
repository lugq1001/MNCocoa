//
//  NumberExtensions.swift
//  MNCocoa
//
//  Created by Ayukey on 2018/6/10.
//  Copyright © 2018年 陆广庆. All rights reserved.
//
#if os(OSX)
import Cocoa
#elseif os(iOS)
import UIKit

// MARK: - Properties
public extension Float {
    
    /// SwifterSwift: Int.
    var int: Int {
        return Int(self)
    }
    
    /// SwifterSwift: Double.
    var double: Double {
        return Double(self)
    }
    
    #if canImport(CoreGraphics)
    /// SwifterSwift: CGFloat.
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
    #endif
    
}
#endif
