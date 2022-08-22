//
//  TasksListViewControllerViewController.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListViewControllerView: TTPView {}

final class TTPTasksListViewControllerViewController: UIViewController {
    
    var presenter: TTPTasksListViewControllerPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
}

extension TTPTasksListViewControllerViewController: TTPTasksListViewControllerView {
    
}
