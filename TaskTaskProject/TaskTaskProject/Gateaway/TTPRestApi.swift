//
//  TTPRestApi.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation
import Combine

// - TVGNetworkManagerProtocol defines the base protocol to manage remote API calls
protocol TTPRestAPIProtocol: AnyObject{
    // - main fetch from remote function
    func fetch<T>(type: T.Type,
                url: URL) -> AnyPublisher<T, TTPError> where T: Decodable
    func fetchArray<T>(type: [T].Type,
                                                                                       url: URL) -> AnyPublisher<[T], TTPError> where T: Decodable
}

// - TVGNetworkManager a final class to give a fetch an implementation
final class TTPRestAPI: TTPRestAPIProtocol {
    func fetchArray<T>(type: [T].Type, url: URL) -> AnyPublisher<[T], TTPError> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.global(qos: .background))
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else {
                    throw TTPError.statusCode
                }
                return response.data
            }
            .decode(type: [T].self, decoder: JSONDecoder())
            .mapError{ TTPError.map($0)}
            .eraseToAnyPublisher()
    }
    
    
    // - fetch main implementation
    func fetch<T>(type: T.Type, url: URL) -> AnyPublisher<T, TTPError> where T : Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.global(qos: .background))
            .tryMap { response in
                guard let httpURLResponse = response.response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else {
                    throw TTPError.statusCode
                }
                return response.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError{ TTPError.map($0)}
            .eraseToAnyPublisher()
    }
}
