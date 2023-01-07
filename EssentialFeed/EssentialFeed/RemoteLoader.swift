//
//  RemoteLoader.swift
//  EssentialFeed
//
//  Created by Trip Phillips on 1/6/23.
//

import Foundation

public final class RemoteLoader<Resource> {
    private let url: URL
    private let client: HTTPClient
    private let mapper: Mapper
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = Swift.Result<Resource, Swift.Error>
    public typealias Mapper = (Data, HTTPURLResponse) throws -> Resource
    
    public init(url: URL, client: HTTPClient, mapper: @escaping Mapper) {
        self.url = url
        self.client = client
        self.mapper = mapper
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success((let data, let response)):
                completion(self.map(data, from: response))
            case .failure(_):
                completion(.failure(Error.connectivity))
            }
        }
    }
    
    private func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            return .success( try mapper(data, response))
        } catch {
            return .failure(Error.invalidData)
        }
    }
}
