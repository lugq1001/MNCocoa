//
//  MNCocoa.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/6/11.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#if os(OSX)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

public struct MNCocoa {
    
    public static var ver: String {
        return Application.appVersion
    }
    
}
