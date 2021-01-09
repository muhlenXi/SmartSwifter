//
//  SSFile.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import Foundation

public class SSFile {
    
    /// documentDirectory
    public static var documentDirectoryURL: URL{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    /// cachesDirectory
    public static var cachesDirectoryURL: URL {
        return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    }
    
    /// libraryDirectory
    public static var libraryDirectoryURL: URL {
        return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
    }
    
    
    /// is exist  file in document directory
    public static func isExistInDocumentDirectory(fileName: String) -> Bool {
        let path = self.documentDirectoryURL.appendingPathComponent(fileName).path
        return self.isExist(path: path)
    }
    
    /// is exist  file in caches directory
    public static func isExistInCachesDirectory(fileName: String) -> Bool {
        let path = self.cachesDirectoryURL.appendingPathComponent(fileName).path
        return self.isExist(path: path)
    }
    
    /// is exist  file In library directory
    public static func isExistInLibraryDirectory(fileName: String) -> Bool {
        let path = self.libraryDirectoryURL.appendingPathComponent(fileName).path
        return self.isExist(path: path)
    }
    
    /// is exist file at path
    public static func isExist(path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
}

