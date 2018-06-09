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
import CryptoSwift

public extension String {

    public var b64Encode: String {
        return Data(self.utf8).base64EncodedString()
    }

    public var b64Decode: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    public var md5: String {
        return self.md5()
    }

    public var isEmail: Bool {
        let regEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: self)
    }

    public var urlEncoded: String {
        if let escapedString = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return escapedString
        }
        return self
    }
 
    public var cgFloatValue: CGFloat {
        guard let n = NumberFormatter().number(from: self) else {
            return 0
        }
        return CGFloat(n.floatValue)
    }
 
}
