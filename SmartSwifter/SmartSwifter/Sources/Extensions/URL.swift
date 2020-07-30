//
//  URL.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import Foundation

public extension URL {
   /// 获取 URL 参数和值
   var ss_queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    /// 根据 host 和 queryItems 创建 URL (自动对中文编码处理)
    static func ss_createURLWith(host: String, querys: [String: Any]) -> URL? {
        let components = NSURLComponents.init(string: host)
        var queryItems = [URLQueryItem]()
        for (key, value) in querys {
            let valueString = "\(value)"
            queryItems.append(URLQueryItem.init(name: key, value: valueString))
        }
        components?.queryItems = queryItems
        return components?.url
    }
    
}
