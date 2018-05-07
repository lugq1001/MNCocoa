//
//  UIApplication.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/5/7.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#if os(OSX)

#elseif os(iOS)
import UIKit

extension UIApplication {
    
    public static func showNetworkIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    public static func hideNetworkIndicator() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
}
#endif
