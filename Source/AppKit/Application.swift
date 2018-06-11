//
//  Application.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/5/8.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
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
    
}
#endif
