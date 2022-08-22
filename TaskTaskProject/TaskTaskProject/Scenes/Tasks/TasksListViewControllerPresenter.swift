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
    func getTasksCount(with searchActive: Bool) -> Int
    func getTaskName(at row: Int, with searchActive: Bool) -> String?
    func getTaskSubtitle(at row: Int, with searchActive: Bool) -> String?
    func searchTastk(with text: String?)
}

final class TTPTasksListPresenter {
    
    var view: TTPView!
    var interactor: TTPInteractor!
    var router: TTPRouter!
    var tasks: [Task]?
    var searchedTasks: [Task]?
    private var searchedText: String? = ""
    
}

extension TTPTasksListPresenter: TTPTasksListPresenterProtocol {
    func viewDidLoad() {
        guard let interactor = interactor as? TTPTasksListInteractorProtocol else { return }
        DispatchQueue.global(qos: .background).async {
            interactor.fetchTasksList()
        }
    }
    
    func getTasksCount(with searchActive: Bool) -> Int {
        if searchActive  && !(searchedText?.trimmingCharacters(in: .whitespaces).isEmpty)!  {
            return searchedTasks?.count ?? 0
        }else{
            return tasks?.count ?? 0
        }
    }
    
    func getTaskName(at row: Int, with searchActive: Bool) -> String? {
        if searchActive && !(searchedText?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            return searchedTasks?[row].overrideName
        }else{
            return tasks?[row].overrideName
        }
    }
    
    func getTaskSubtitle(at row: Int, with searchActive: Bool) -> String? {
        let task = searchActive  && !(searchedText?.trimmingCharacters(in: .whitespaces).isEmpty)!  ? searchedTasks?[row] : tasks?[row]
        let taskMinutes = task?.durationInMinutes
        let taskDeposit = task?.bookingDeposit
        return "\(taskMinutes ?? 0) min, $ \(taskDeposit ?? 0)"
    }
    
    func searchTastk(with text: String?) {
        searchedText = text
       searchedTasks = tasks?.filter({ task in
           return task.overrideName.lowercased().contains(text!.lowercased())
        })
        guard let view = view as? TTPTasksListView else { return }
        view.reloadTable(willShowLoader: false)
    }
}

extension TTPTasksListPresenter {
    func didFetchTasksList(with tasks: [Task]) {
        guard let view = view as? TTPTasksListView else { return }
        self.tasks = tasks
        DispatchQueue.main.async {
            view.reloadTable(willShowLoader: true)
        }
    }
    
    func didFailedFetch() {
        guard let view = view as? TTPTasksListView else { return }
        view.showAlertController()
    }
}

