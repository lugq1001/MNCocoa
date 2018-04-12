//
//  Image.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/4/22.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
    public typealias Image = NSImage
    public typealias Color = NSColor
#elseif os(iOS)
    import UIKit
    public typealias Image = UIImage
    public typealias Color = UIColor
#endif
import Kingfisher

public extension Image {

    public func tint(color: Color) -> Image {
        let img = self.kf.overlaying(with: color, fraction: CGFloat.leastNormalMagnitude)
        return img
    }

    static func find(name: String, inBundle bundle: Bundle) -> Image? {
        #if os(OSX)
            return bundle.image(forResource: NSImage.Name(rawValue: name))
        #elseif os(iOS)
            return Image.init(named: name, in: bundle, compatibleWith: nil)
        #endif

    }

    /*!
     保持图片比例裁剪
     */
    public func clip(to size: CGSize) -> Image {
        let img = self.resize(to: size, mode: .aspectFit)
        return img
    }

    /*!
     不限比例裁剪至相应尺寸
     */
    public func crop(to size: CGSize) -> Image {
        let img = self.resize(to: size)
        return img
    }

    fileprivate func resize(to size: CGSize, mode: ContentMode = .none) -> Image {
        #if os(OSX)
            var finalSize = size
            if let scale = NSScreen.main?.backingScaleFactor {
                finalSize = CGSize(width: size.width * scale, height: size.height * scale)
            }
            let img = self.kf.resize(to: finalSize, for: mode)
            return img
        #elseif os(iOS)
            let finalSize = CGSize(width: size.width * scale, height: size.height * UIScreen.main.scale)
            let img = self.kf.resize(to: finalSize, for: mode)
            return img
        #endif

    }

}