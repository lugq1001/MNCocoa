//
//  View.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/5/22.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

import UIKit

extension UIView {
    
    public var safeInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return UIEdgeInsets.zero
        }
    }
    
//    var safeArea: ConstraintBasicAttributesDSL {
//        if #available(iOS 11.0, *) {
//            return self.safeAreaLayoutGuide.snp
//        }
//        return self.snp
//    }
}
