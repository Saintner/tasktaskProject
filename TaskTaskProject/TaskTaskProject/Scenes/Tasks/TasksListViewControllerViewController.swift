//
//  TasksListViewControllerViewController.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit

protocol TTPTasksListView: TTPView {}

final class TTPTasksListViewController: UIViewController {
    
    var presenter: TTPPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let presenter = presenter as? TTPTasksListPresenter else { return }
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension TTPTasksListViewController: TTPTasksListView {
    
}
