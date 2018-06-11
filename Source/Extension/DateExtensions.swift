//
//  DateExtensions.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/5/23.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

public extension Date {

    public static func formatUTC(_ utcString: String) -> Date {
        if utcString.isEmpty {
            return Date()
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let localDate = formatter.date(from: utcString) {
            return localDate
        }
        return Date()
    }

    public func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    public var millisSecondSince1970: Double {
        let ms = self.timeIntervalSince1970
        return ms * 1000
    }

    public var secondSince1970: Double {
        let s = self.timeIntervalSince1970
        return s
    }
}
