//
//  Image.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/4/22.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif
import Kingfisher

public extension NSImage {
    
    static func find(name: String, inBundle bundle: Bundle) -> NSImage? {
        return bundle.image(forResource: NSImage.Name(rawValue: name))
    }
   
    public func tint(color: NSColor) -> NSImage {
        let img = self.kf.overlaying(with: color, fraction: CGFloat.leastNormalMagnitude)
        return img
    }
    
    /*!
     保持图片比例裁剪
     */
    public func clip(to size: CGSize) -> NSImage {
        let img = self.resize(to: size, mode: .aspectFit)
        return img
    }
    
    /*!
     不限比例裁剪至相应尺寸
     */
    public func crop(to size: CGSize) -> NSImage {
        let img = self.resize(to: size)
        return img
    }
    
    fileprivate func resize(to size: CGSize, mode: ContentMode = .none) -> NSImage {
        var finalSize = size
        if let scale = NSScreen.main?.backingScaleFactor {
            finalSize = CGSize(width: size.width * scale, height: size.height * scale)
        }
        let img = self.kf.resize(to: finalSize, for: mode)
        return img
    }
    
}


