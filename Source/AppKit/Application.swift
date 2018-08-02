//
//  Application.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/5/8.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
import Cocoa
public typealias Application = NSApplication
#elseif os(iOS)
import UIKit
public typealias Application = UIApplication
#endif

extension Application {
    
    public static func showNetworkIndicator() {
        #if os(OSX)
        
        #elseif os(iOS)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
        #endif
    }
    
    public static func hideNetworkIndicator() {
        #if os(OSX)
        
        #elseif os(iOS)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        #endif
    }
    
    public static var appVersion: String {
        let dict = infoDict
        if let versionString = dict["CFBundleShortVersionString"], let version = versionString as? String {
            return version
        }
        return ""
    }
    
    public static var bundleVersion: String {
        let dict = infoDict
        if let versionString = dict["CFBundleVersion"], let version = versionString as? String {
            return version
        }
        return ""
    }
    
    public static var bundleId: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    public static var infoDict: [String: Any] {
        if let info = Bundle.main.infoDictionary {
            return info
        }
        return [:]
    }
    
    #if os(OSX)
    
    #elseif os(iOS)
    class func topViewController() -> UIViewController {
        return topViewController(UIApplication.shared.keyWindow!.rootViewController!)
    }
    
    class func topViewController(_ rootViewController: UIViewController) -> UIViewController {
        if let presented = rootViewController.presentedViewController {
            if let navi = presented as? UINavigationController {
                let lastViewController = navi.viewControllers.last
                return topViewController(lastViewController!)
            }
            return topViewController(presented)
        } else {
            return rootViewController
        }
    }
    #endif
    
}
