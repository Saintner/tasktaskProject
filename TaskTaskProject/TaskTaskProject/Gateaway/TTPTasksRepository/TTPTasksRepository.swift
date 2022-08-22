//
//  TTPTasksRepository.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation
import Combine

// - TTPTasksServicesProtocol takes networkManager as a TTPRestAPIProtocol property and
// - fetchShows method as AnyPublisher<[TTPTaskRepositoryResponse],TTPError>

protocol TTPTasksServicesProtocol {
    var networkManager: TTPRestAPIProtocol { get set }
    
    func fetchTasks() -> AnyPublisher<TTPTaskRepositoryResponse,TTPError>
}

// - TVGShowsServices final class to handle Show entity Remote Services
final class TTPTasksServices: TTPTasksServicesProtocol {
    
    var networkManager: TTPRestAPIProtocol
    
    init(networkManager: TTPRestAPIProtocol) {
            self.networkManager = networkManager
    }
    
    func fetchTasks() -> AnyPublisher<TTPTaskRepositoryResponse, TTPError> {
        let endpoint = TTPEndpoint.tasks(with: TTPConstants.tasksListSearchQueryValue)
        return networkManager.fetch(type: TTPTaskRepositoryResponse.self, url: endpoint.url)
    }
}
