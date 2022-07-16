//
//  Endpoints.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import Foundation

enum Endpoints: EndpointProtocol {
    case getAllNews
    
    var baseURL: String {
        return "https://data.messari.io/api/"
    }
    
    var absoluteURL: String {
        switch self {
        case .getAllNews:
            return baseURL + "v1/news"
        }
    }
    var params: [String: String] {
        switch self {
        case .getAllNews:
            return [:]
        }
    }
    
    var headers: [String: String] {
        return [:]

//        return [
//            "Content-type": "application/json",
//            "Accept": "application/json"
//        ]
    }
}
