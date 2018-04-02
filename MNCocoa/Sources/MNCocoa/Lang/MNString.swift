//
//  MNString.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/1/14.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

public extension String {

    public var b64Encode: String {
        return Data(self.utf8).base64EncodedString()
    }

    public var b64Decode: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
