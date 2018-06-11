//
//  ViewControllerExtensions.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/6/9.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#if os(OSX)
import Cocoa

#elseif os(iOS)
import UIKit
extension UINavigationController {
    
    public func popViewController() {
        self.popViewController(animated: true)
    }
    
}
#endif
