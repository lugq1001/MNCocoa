//
//  RecordingButton.swift
//  NCChat
//
//  Created by 陆广庆 on 2018/4/2.
//  Copyright © 2018年 陆广庆. All rights reserved.
//  录音按钮

import UIKit

struct RecordingButtonStyle {
    
}

public class RecordingButton: UIButton {

    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        chatLogger.debug("touchesBegan")
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        chatLogger.debug("touchesMoved")
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        chatLogger.debug("touchesEnded")
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        chatLogger.debug("touchesCancelled")
    }
}
