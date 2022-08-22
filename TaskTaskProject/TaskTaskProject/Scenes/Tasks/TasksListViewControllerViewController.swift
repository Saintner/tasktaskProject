//
//  TasksListViewControllerViewController.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit
import SnapKit

protocol TTPTasksListView: TTPView {}

final class TTPTasksListViewController: UIViewController {
    
    var presenter: TTPPresenter!
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let presenter = presenter as? TTPTasksListPresenter else { return }
        presenter.viewDidLoad()
        setupSearchTextField()
        // Do any additional setup after loading the view.
    }
    
    private func setupSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(10)
            make.leading.equalTo(28)
            make.trailing.equalTo(-28)
            make.height.equalTo(50)
        }
    }
}

extension TTPTasksListViewController: TTPTasksListView {
    
}
