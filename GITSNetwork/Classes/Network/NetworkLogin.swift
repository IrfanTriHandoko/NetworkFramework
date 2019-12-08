//
//  NetworkIWKBUExt.swift
//  GITSNetwork
//
//  Created by IRFAN TRIHANDOKO on 18/11/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Alamofire

public enum NetworkLogin: URLRequestConvertible {
    
    static var token:String = ""
    static let baseURLString = "\(GITSApps.GetURLV1())"
    
    // Auth
    case doLogin(token: String, username: String, password: String)
    
    var method: HTTPMethod {
        switch self {
        case .doLogin(let token, _, _):
            NetworkLogin.token = token
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .doLogin(_, _, _):
            return ("login")
        }
    }
    
    var param: [String: Any] {
        switch self {
        case .doLogin(_, let username, let password):
            return ["username": username, "password": password]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        switch self {
        case .doLogin(_, _, _):
            url = try NetworkLogin.baseURLString.asURL()
        }
        urlRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
        urlRequest?.httpMethod = method.rawValue
        if self.method == .get {
            urlRequest = try URLEncoding.default.encode(urlRequest!, with: param)
        } else {
            urlRequest = try JSONEncoding.default.encode(urlRequest!, with: param)
        }
        urlRequest?.addValue(NetworkLogin.token, forHTTPHeaderField: "accesstoken")
        print("URL API => "+(urlRequest?.url?.absoluteString)!)
        print("Parameter => \(param)")
        return urlRequest!
    }
}
