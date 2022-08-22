//
//  TasksListViewControllerRouter.swift
//  TaskTaskProject
//
//  Created by User on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListViewControllerRouterProtocol {}

class TTPTasksListViewControllerRouter: TTPTasksListViewControllerRouterProtocol {
    
    private unowned let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}
