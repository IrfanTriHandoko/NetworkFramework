//
//  GITSApps.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/15/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation


public struct GITSApps{
    static let GITSConfigBundle = [
       "base_url" :""
    ]
    
    public static func GetConfig() -> Dictionary<String, Any>? {
        var myDict: Dictionary<String, Any>?
        if let path = Bundle.main.path(forResource: "KMConfig", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            myDict = dict
        }
        
        if let url = Bundle.main.url(forResource: "KMConfig", withExtension: "plist")
        {
            let d = NSDictionary(contentsOf: url)
            debugPrint(url)
            debugPrint(d ?? [:])
        } else {
            debugPrint("No url")
        }
        
        if let fileUrl = Bundle.main.url(forResource: "KMConfig", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] { // [String: Any] which ever it is
                debugPrint(result)
            }
        }
        return myDict
    }
    
    // MARK: - Base URL
    public static func GetURLV1() -> String{
        if let config = GetConfig() {
            return config["base_url_v1"] as! String
        }
        return ""
    }
    
    public static func GetURLV2() -> String{
        if let config = GetConfig() {
            return config["base_url_v2"] as! String
        }
        return ""
    }
    
    public static func GetURLV3() -> String{
        if let config = GetConfig() {
            return config["base_url_v3"] as! String
        }
        return ""
    }
    
    // MARK: - Environment
    public static func isProd() -> Bool {
        if let config = GetConfig() {
            if config["is_prod"] as! Bool {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    public static func isDev() -> Bool {
        if let config = GetConfig() {
            if config["is_dev"] as! Bool {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    public static func isStaging() -> Bool {
        if let config = GetConfig() {
            if config["is_staging"] as! Bool {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    public static func isTesting() -> Bool {
        if let config = GetConfig() {
            if config["is_testing"] as! Bool {
                return true
            } else {
                return false
            }
        }
        return false
    }
}

