//
//  ServiceProvider.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import Foundation
import Combine
enum ResponseErrors: String, LocalizedError {
    case unknownError = "Something goes wrong."
}


class ServiceProvider<Endpoint : EndpointProtocol> {
    func getRequest(from endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: ResponseErrors.unknownError)
                .eraseToAnyPublisher()
        }
        return requestData(with: request)
            .eraseToAnyPublisher()
    }
    
    private func performRequest(for endpoint: Endpoint) -> URLRequest? {
        guard var urlComponents = URLComponents(string: endpoint.absoluteURL) else {
            return nil
        }
        
        urlComponents.queryItems = endpoint.params.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })

        guard let url = urlComponents.url else {
            return nil
        }

        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
        
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
    // MARK: - Getting data
    private func requestData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                ResponseErrors.unknownError
            })
            .map {
                $0.data
            }
            .eraseToAnyPublisher()
    }

}
