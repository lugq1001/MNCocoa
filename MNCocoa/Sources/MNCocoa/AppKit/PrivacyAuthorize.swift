//
//  PrivacyAuthorize.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2018/4/3.
//  Copyright © 2018年 陆广庆. All rights reserved.
//  权限管理工具类

#if os(OSX)
import Cocoa
#elseif os(iOS)
import AVFoundation

public enum PrivacyResult {
    case authorized
    case denied
    case unkonwon
}

public class PrivacyAuthorize: NSObject {

    public static func requestAudioPrivacy() -> PrivacyResult {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        switch status {
        case .authorized: // 客户端被授权访问支持媒体类型的硬件。
            return .authorized
        case .notDetermined: // 表示用户尚未对客户端是否能够访问硬件做出选择。
            AVAudioSession.sharedInstance().requestRecordPermission { _ in
            }
            return .unkonwon
        case .denied: // 用户显式地拒绝为客户端提供支持媒体类型的硬件的访问。
            return .denied
        case .restricted: // 客户端未被授权访问媒体类型的硬件。用户不能更改客户端的状态，这可能是由于一些积极的限制，如父母控制的存在。
            return .denied
        }
    }
}
#endif

