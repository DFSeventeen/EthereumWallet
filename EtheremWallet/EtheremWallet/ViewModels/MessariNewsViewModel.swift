//
//  NewsViewModel.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import SwiftUI
import Combine

final class MessariNewsViewModel: ObservableObject {
    private let serviceProvider = ServiceProvider<Endpoints>()
    private var cancell = Set<AnyCancellable>()
    
    @Published private(set) var messariNewsArray: [MessariNews] = []
    
    func getSources() {
        serviceProvider.getRequest(from: .getAllNews)
            .decode(type: MessariNewsResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.messariNewsArray, on: self)
            .store(in: &cancell)
    }
}
