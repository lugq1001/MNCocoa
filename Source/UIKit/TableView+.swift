//
//  ScrollView+.swift
//  MNCocoa
//
//  Created by Ayukey on 2018/6/10.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit

extension UITableView {
    public func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}
#endif


