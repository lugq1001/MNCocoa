//
//  Path.swift
//  MNCocoa
//
//  Created by 陆广庆 on 2017/12/20.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif
import FileKit

public extension Path {
    
    /// 是否为文件
    public var mn_isFile: Bool {
        if let type = self.fileType {
            return type == .regular
        }
        return !isDirectory && !isDirectoryFile
    }
    
    /// 是否为隐藏路径
    public var mn_isHide: Bool {
        if self.fileName.hasPrefix(".") {
            return true
        }
        if let isHide = try? url.resourceValues(forKeys: [.isHiddenKey]).isHidden {
            return isHide ?? false
        }
        return false
    }
    
    public func mn_childFiles(includeHide: Bool) -> [Path] {
        let children = self.children()
        var result: [Path] = []
        for c in children {
            if c.mn_isFile {
                if c.mn_isHide && !includeHide {
                    continue
                }
                result.append(c)
            }
        }
        return result
    }
    
    
    public var mn_mimeType: String {
        if let mime = MNMimeType.ExtMapper[self.pathExtension] {
            return mime
        }
        return MNMimeType.UNKNOWN
    }
    
    public var mn_fileSize: Int {
        if let fileSize = self.attributes[FileAttributeKey.size] as? Int {
            return fileSize
        }
        return 0
    }
    
    /// 文件夹路径，不包含文件名
    public var mn_parent: Path {
        let folderPath = self.url.deletingLastPathComponent().path
        return Path(folderPath)
    }
    
    /// 文件修改标记
    public var mn_modifyTag: String {
        let date = self.modificationDate ?? Date()
        let tag = "\(self.mn_fileSize)-\(date.timeIntervalSince1970)"
        return tag
    }
    
    /// 文件大小 用于显示 如 12.32 M
    public var mn_displaySize: String {
        let size = self.mn_fileSize
        return size.mn_displayFileSize
    }
    
    public var mn_bookmarkData: Data? {
        return try? url.bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)
    }
    
    
}

extension Data {
    
    public var mn_bookmarkURL: URL? {
        var isStale = false
        if let url = try? URL.init(resolvingBookmarkData: self, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale) {
            return url
        }
        return nil
    }
    
}


extension Int {
    
    /// 文件大小 用于显示 如 12.32 M
    public var mn_displayFileSize: String {
        let doubleVal = Double(self)
        let kb: Double = 1024
        let mb: Double = kb * 1024
        let gb: Double = mb * 1024
        let sizeVal: Double
        let suffix: String
        let needFormat: Bool
        if (doubleVal >= gb) {
            sizeVal = doubleVal / gb
            suffix = "GB"
            needFormat = true
        } else if (doubleVal >= mb) {
            sizeVal = doubleVal / mb
            suffix = "M"
            needFormat = true
        } else if (doubleVal >= kb) {
            sizeVal = doubleVal / kb
            suffix = "KB"
            needFormat = false
        } else {
            sizeVal = doubleVal
            suffix = "B"
            needFormat = false
        }
        let result: String
        if needFormat {
            result = String.init(format: "%.2f %@", sizeVal, suffix)
        } else {
            result = "\(Int(sizeVal))\(suffix)"
        }
        
        return result
        
    }
}




