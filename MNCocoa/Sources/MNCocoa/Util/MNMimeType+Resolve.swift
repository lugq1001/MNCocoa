//
//  MNMimeType+Resolve.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/8/6.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

private let kMimeTypeGoogleDoc = "application/vnd.google-apps.document"
private let kMimeTypeGoogleSheet = "application/vnd.google-apps.spreadsheet"
private let kMimeTypeGooglePresentation = "application/vnd.google-apps.presentation"
private let kMimeTypeGoogleDrawing = "application/vnd.google-apps.drawing"
private let kMimeTypeGoogleForm = "application/vnd.google-apps.form"
private let kMimeTypeGoogleScript = "application/vnd.google-apps.script"

public extension MNMimeType {

    /// 解析mimeType
    public mutating func resolve() {
        let mime = mimeType.lowercased()
        for (k, v) in supportMimeTypes {
            if mime.hasPrefix(k) {
                canPreview = true
                ext = v
                break
            }
        }
        if ext.isEmpty {
            switch mimeType {
            case kMimeTypeGoogleForm:
                ext = "zip"
            default:
                ext = "data"
            }
        }
        switch mimeType {
        case "application/octet-stream":
            category = .octetstream
        case "application/vnd.google-apps.folder":
            category = .gfolder
        case "application/pdf":
            category = .pdf
        case "text/html":
            category = .html
        default:
            break
        }
        checkGoogleMimeType()
        checkMediaType()
    }

    private mutating func checkGoogleMimeType() {
        if [kMimeTypeGoogleDoc,
            "application/msword",
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document"].contains(mimeType) {
            category = .docs
            return
        }
        if [kMimeTypeGoogleSheet,
            "application/vnd.ms-excel",
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"].contains(mimeType) {
            category = .sheets
            return
        }
        if [kMimeTypeGooglePresentation,
            "application/vnd.ms-powerpoint",
            "application/vnd.openxmlformats-officedocument.presentationml.presentation"].contains(mimeType) {
            category = .slides
            return
        }
    }

    private mutating func checkMediaType() {
        if mimeType.hasPrefix("image") || mimeType == kMimeTypeGoogleDrawing {
            category = .image
            return
        }
        if mimeType.hasPrefix("video") {
            category = .video
            return
        }
        if mimeType.hasPrefix("audio") {
            category = .audio
            return
        }
        if mimeType.hasPrefix("text") || mimeType == kMimeTypeGoogleScript {
            category = .text
            return
        }
    }
}

private let supportMimeTypes = [

    "text/csv": "csv",
    "text/css": "css",
    "text/html": "html",
    "text/plain": "txt",
    "text/xml": "xml",

    "application/json": "json",
    "audio/mp3": "mp3",
    "audio/x-aac": "aac",
    "audio/x-m4a": "m4a",
    "audio/mpeg": "m2a",
    "audio/x-wav": "wav",
    "video/3gpp": "3gp",
    "video/quicktime": "qt",
    "video/mp4": "mp4",
    "video/mpeg": "m2v",

    "image/gif": "gif",
    "image/x-icon": "icom",
    "image/jpeg": "jpeg",
    "image/jpg": "jpeg",
    "image/png": "png",
    "image/svg+xml": "svg",
    "image/tiff": "tiff",

    "application/postscript": "ps",
    "application/javascript": "js",
    "application/pdf": "pdf",
    "application/xhtml+xml": "xhtml",
    "application/rtf": "rtf",

    "application/msword": "doc",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document": "docx",
    "application/vnd.ms-powerpoint": "ppt",
    "application/vnd.openxmlformats-officedocument.presentationml.presentation": "pptx",
    "application/vnd.ms-excel": "xls",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": "xlsx",

    // google文件
    kMimeTypeGoogleDoc: "docx" ,
    kMimeTypeGoogleSheet: "xlsx",
    kMimeTypeGooglePresentation: "pptx",
    kMimeTypeGoogleDrawing: "png",
    kMimeTypeGoogleScript: "json"
]
