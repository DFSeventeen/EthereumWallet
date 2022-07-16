//
//  EndpointProtocol.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import Foundation
protocol EndpointProtocol {
        
    var baseURL: String { get }
    
    var absoluteURL: String { get }
    
    var params: [String: String] { get }
    
    var headers: [String: String] { get }
}
