//
//  TasksListViewControllerPresenter.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListPresenterProtocol: TTPPresenter, TTPTaskListInteractorOuput {
    func viewDidLoad()
    func getTasksCount() -> Int
    func getTaskName(at row: Int) -> String?
    func getTaskSubtitle(at row: Int) -> String?
}

final class TTPTasksListPresenter {
    
    var view: TTPView!
    var interactor: TTPInteractor!
    var router: TTPRouter!
    var tasks: [Task]?
    
}

extension TTPTasksListPresenter: TTPTasksListPresenterProtocol {
    func viewDidLoad() {
        guard let interactor = interactor as? TTPTasksListInteractorProtocol else { return }
        DispatchQueue.global(qos: .background).async {
            interactor.fetchTasksList()
        }
    }
    
    func getTasksCount() -> Int {
        return tasks?.count ?? 0
    }
    
    func getTaskName(at row: Int) -> String? {
        return tasks?[row].overrideName
    }
    
    func getTaskSubtitle(at row: Int) -> String? {
        let task = tasks?[row]
        let taskMinutes = task?.durationInMinutes
        let taskDeposit = task?.bookingDeposit
        return "\(taskMinutes ?? 0) min, $ \(taskDeposit ?? 0)"
    }
}

extension TTPTasksListPresenter {
    func didFetchTasksList(with tasks: [Task]) {
        guard let view = view as? TTPTasksListView else { return }
        self.tasks = tasks
        DispatchQueue.main.async {
            view.reloadTable()
        }
    }
    
    func didFailedFetch() {
        
    }
}

