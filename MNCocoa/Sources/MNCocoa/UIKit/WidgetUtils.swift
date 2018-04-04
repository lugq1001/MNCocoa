//
//  WidgetUtils.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/4/3.
//  Copyright © 2018年 陆广庆. All rights reserved.
//

import UIKit

public class WidgetUtils: NSObject {

}

public extension UIViewController {

    public func showAlert(title: String? = nil, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
