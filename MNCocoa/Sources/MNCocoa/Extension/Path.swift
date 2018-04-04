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
    public var isRegularFile: Bool {
        if let type = self.fileType {
            return type == .regular
        }
        return !isDirectory && !isDirectoryFile
    }

    /// 是否为隐藏路径
    public var isHide: Bool {
        if self.fileName.hasPrefix(".") {
            return true
        }
        if let isHide = try? url.resourceValues(forKeys: [.isHiddenKey]).isHidden {
            return isHide ?? false
        }
        return false
    }

    public func childRegularFiles(includeHide: Bool) -> [Path] {
        let children = self.children()
        var result: [Path] = []
        for c in children where c.isRegularFile {
            if c.isHide && !includeHide {
                continue
            }
            result.append(c)
        }
        return result
    }

    public var mimeType: String {
        if let mime = MNMimeType.ExtMapper[self.pathExtension] {
            return mime
        }
        return MNMimeType.UNKNOWN
    }

    public var fileSize: Int {
        if let fileSize = self.attributes[FileAttributeKey.size] as? Int {
            return fileSize
        }
        return 0
    }

    /// 文件夹路径，不包含文件名
    public var mnParent: Path {
        let folderPath = self.url.deletingLastPathComponent().path
        return Path(folderPath)
    }

    /// 文件修改标记
    public var modifyTag: String {
        let date = self.modificationDate ?? Date()
        let tag = "\(self.fileSize)-\(date.timeIntervalSince1970)"
        return tag
    }

    /// 文件大小 用于显示 如 12.32 M
    public var fileDisplaySize: String {
        let size = self.fileSize
        return size.displayFileSize
    }

    public var bookmarkData: Data? {
        #if os(OSX)
            return try? url.bookmarkData(options: .withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)
        #elseif os(iOS)
            return nil
        #endif

    }

}

extension Data {

    public var bookmarkURL: URL? {
        #if os(OSX)
            var isStale = false
            if let url = try? URL.init(resolvingBookmarkData: self, options: .withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale) {
                return url
            }
        #elseif os(iOS)

        #endif
        return nil
    }

}

extension Int {

    /// 文件大小 用于显示 如 12.32 M
    public var displayFileSize: String {
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
