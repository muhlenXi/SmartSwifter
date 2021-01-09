//
//  SSDate.swift
//  SmartSwifter
//
//  Created by muhlenXi on 2020/7/30.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

import Foundation

public class SSDate: NSObject {
    
    /// Common date format
    public enum DateFormat: String {
        /// yyyy-MM-dd
        case yyyy_MM_dd = "yyyy-MM-dd"
        /// yyyy年MM月dd日
        case yyyy_MM_dd_chinese = "yyyy年MM月dd日"
        /// MM-dd
        case MM_dd = "MM-dd"
        /// MM月dd日
        case MM_dd_chinese = "MM月dd日"
        /// HH:mm:ss
        case HH_mm_ss = "HH:mm:ss"
        /// HH:mm
        case HH_mm = "HH:mm"
        /// yyyy
        case yyyy = "yyyy"
        /// yyyy-MM-dd HH:mm 横线
        case yyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
        /// yyyy-MM-dd HH:mm:ss 横线
        case yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
        /// yyyy-MM-dd HH:mm:ss.SSS
        case yyyy_MM_dd_HH_mm_ssSSS = "yyyy-MM-dd HH:mm:ss.SSS"
        /// yyyy/MM/dd HH:mm 斜线
        case yyyy_MM_dd_HH_mm_slant = "yyyy/MM/dd HH:mm"
        /// yyyy/MM/dd HH:mm:ss 斜线
        case yyyy_MM_dd_HH_mm_ss_slant = "yyyy/MM/dd HH:mm:ss"
    }
    
    /// Get current timestamp (TimeInterval)
    public static func currentTimeStamp() -> TimeInterval {
        return Date().timeIntervalSince1970
    }
    
    /// Get current timestamp (Int64)
    public static func currentTimeStamp() -> Int64 {
        return Int64(currentTimeStamp())
    }
}


// MARK: - Date
public extension SSDate {
    /// Date ----> String
    static func toDateString(date: Date, dateFormat: DateFormat) -> String {
        return toDateString(date: date, dateFormat: dateFormat.rawValue)
    }
    
    /// Date  ----> String
    static func toDateString(date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
    
    /// String ----> Date
    static func toDate(dateString: String, dateFormat: DateFormat) -> Date? {
        return toDate(dateString: dateString, dateFormat: dateFormat.rawValue)
    }
    
    /// String  ----> Date
    static func toDate(dateString: String, dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)
    }
}

// MARK: - TimeInterval/Double
public extension SSDate {
    /// TimeInterval/Double ---> String （10 位时间戳）
    static func toDateString(timeInterval: TimeInterval, dateFormat: DateFormat) -> String {
        let date = toDate(timeInterval: timeInterval)
        return toDateString(date: date, dateFormat: dateFormat.rawValue)
    }
    
    /// TimeInterval/Double ---> String （10 位时间戳）
    static func toDateString(timeInterval: TimeInterval, dateFormat: String) -> String {
        let date = toDate(timeInterval: timeInterval)
        return toDateString(date: date, dateFormat: dateFormat)
    }
    
    /// TimeInterval ----> Date （10 位时间戳）
    static func toDate(timeInterval: TimeInterval) -> Date {
        return Date.init(timeIntervalSince1970: timeInterval)
    }
}

// MARK: - Int64 10位时间戳
public extension SSDate {
    /// Int64 ----> String （10 位时间戳）
    static func toDateString(timeStamp: Int64, dateFormat: DateFormat) -> String {
        return toDateString(timeInterval: TimeInterval(timeStamp), dateFormat: dateFormat)
    }
    
    /// Int64 ----> String （10 位时间戳）
    static func toDateString(timeStamp: Int64, dateFormat: String) -> String {
        return toDateString(timeInterval: TimeInterval(timeStamp), dateFormat: dateFormat)
    }
    
    /// Int64 ---->  Date （10 位时间戳）
    static func toDate(timeStamp: Int64) -> Date {
        return toDate(timeInterval: TimeInterval(timeStamp))
    }
}

