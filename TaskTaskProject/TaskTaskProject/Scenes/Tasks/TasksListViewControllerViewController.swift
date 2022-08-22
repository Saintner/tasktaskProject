//
//  TasksListViewControllerViewController.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//  
//

import UIKit
import SnapKit

protocol TTPTasksListView: TTPView {
    func reloadTable()
}

final class TTPTasksListViewController: UIViewController {
    
    var presenter: TTPPresenter!
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.borderStyle = .roundedRect
        let image = UIImage(systemName: "magnifyingglass")
        let rightImageView = UIImageView(image: image)
        rightImageView.tintColor = .black
        textField.rightViewMode = .always
        textField.rightView = rightImageView
        return textField
    }()
    
    private lazy var tasksTableView: UITableView = {
        let table = UITableView()
        table.register(TTPTasksSubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let presenter = presenter as? TTPTasksListPresenter else { return }
        presenter.viewDidLoad()
        setupSearchTextField()
        setupTasksTableView()
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
    
    private func setupTasksTableView() {
        view.addSubview(tasksTableView)
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(searchTextField.snp.bottomMargin).offset(20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-28)
            make.bottomMargin.equalTo(40)
        }
    }
}

extension TTPTasksListViewController: TTPTasksListView {
    func reloadTable() {
        tasksTableView.reloadData()
    }
}

extension TTPTasksListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter as? TTPTasksListPresenter else { return 0 }
        return presenter.getTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let presenter = presenter as? TTPTasksListPresenter else { return cell }
        let row = indexPath.row
        cell.textLabel?.text = presenter.getTaskName(at: row)
        cell.detailTextLabel?.text = presenter.getTaskSubtitle(at: row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}
