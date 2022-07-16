//
//  MessariService.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import Foundation
import Combine

protocol MessariServiceProtocol {
    func getAllNews() -> AnyPublisher<Data, Error>
}

class MessariService: MessariServiceProtocol {
    private let serviceProvider = ServiceProvider<Endpoints>()
    
    func getAllNews() -> AnyPublisher<Data, Error> {
        return serviceProvider.getRequest(from: .getAllNews).eraseToAnyPublisher()
    }
}
