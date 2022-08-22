//
//  TasksListViewControllerInteractor.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit
import Combine

protocol TTPTasksListInteractorProtocol: TTPInteractor {
    func fetchTasksList()
}

protocol TTPTaskListInteractorOuput: TTPInteractorOutput {
    func didFetchTasksList(with tasks: [Task])
    func didFailedFetch()
}

class TTPTasksListInteractor: TTPTasksListInteractorProtocol {
    var presenter: TTPPresenter!
    private var cancellables = Set<AnyCancellable>()
    var tasksRemoteServices: TTPTasksServices
    var output: TTPInteractorOutput?
    
    init(networkManager: TTPRestAPIProtocol) {
        self.tasksRemoteServices = TTPTasksServices(networkManager: networkManager)
    }
    
    func fetchTasksList() {
        guard let output = output as? TTPTaskListInteractorOuput else {
            return
        }
            tasksRemoteServices.fetchTasks().sink { completion in
                switch completion {
                case .failure(_):
                    output.didFailedFetch()
                case .finished:
                    break
                }
            } receiveValue: { response in
                print(response.result)
                output.didFetchTasksList(with: response.result)
            }.store(in: &cancellables)
        }
    
    
}
