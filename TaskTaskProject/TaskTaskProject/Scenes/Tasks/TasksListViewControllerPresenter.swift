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
}

final class TTPTasksListPresenter {
    
    var view: TTPView!
    var interactor: TTPInteractor!
    var router: TTPRouter! 
    
}

extension TTPTasksListPresenter: TTPTasksListPresenterProtocol {
    func viewDidLoad() {
        guard let interactor = interactor as? TTPTasksListInteractorProtocol else { return }
        interactor.fetchTasksList()
    }
}

extension TTPTasksListPresenter {
    func didFetchTasksList(with tasks: [Task]) {
        
    }
    
    func didFailedFetch() {
        
    }
}

