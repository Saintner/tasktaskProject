//
//  TasksListViewControllerRouter.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListRouterProtocol: TTPRouter {}

class TTPTasksListRouter: TTPTasksListRouterProtocol {
    var remoteModelCollection: TTPRestAPI?
    
    var entry: EntryPoint?
    
    static func start() -> TTPRouter {
        let remoteModelCollection = TTPRestAPI()
        
        var view: TTPView = TTPTasksListViewController()
        let router = TTPTasksListRouter()
        var presenter: TTPTasksListPresenterProtocol = TTPTasksListPresenter()
        var interactor: TTPTasksListInteractorProtocol = TTPTasksListInteractor(networkManager: remoteModelCollection)
        
        
        presenter.router = router
        presenter.view = view
//        presenter.delegate = view as? TVGShowsListPresenterDelegate
        presenter.interactor = interactor
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.output = presenter
        router.entry = view as? EntryPoint
        return router
    }
    
}
