//
//  TasksListViewControllerPresenter.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListViewControllerPresenterProtocol: TTPPresenter {}

final class TTPTasksListViewControllerPresenter {
    
    var view: TTPTasksListViewControllerView!
    var interactor: TTPTasksListViewControllerInteractorProtocol!
    var router: TTPTasksListViewControllerRouterProtocol!
    
}

extension TTPTasksListViewControllerPresenter: TTPTasksListViewControllerPresenterProtocol {
    
}
