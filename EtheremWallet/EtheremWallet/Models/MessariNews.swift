//
//  NewsModels.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import Foundation

struct MessariNewsResponse: Codable {
    let data: [MessariNews]
}

struct MessariNews: Codable, Hashable {
    let id: String
    let title: String
    let publishDate : String
    let url : String
    
    private enum CodingKeys : String, CodingKey {
        case id
        case title
        case publishDate = "published_at"
        case url

    }
}
