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
    
    let searchController = UISearchController()
    
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
        setupSearchController()
        setupTasksTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
    }
    
    private func setupTasksTableView() {
        view.addSubview(tasksTableView)
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(50)
            make.leading.equalTo(10)
            make.trailing.equalTo(-28)
            make.bottomMargin.equalTo(-40)
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
        return presenter.getTasksCount(with: searchController.isActive)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let presenter = presenter as? TTPTasksListPresenter else { return cell }
        let row = indexPath.row
        cell.textLabel?.text = presenter.getTaskName(at: row, with: searchController.isActive)
        cell.detailTextLabel?.text = presenter.getTaskSubtitle(at: row, with: searchController.isActive)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

extension TTPTasksListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchText = searchBar.text
        guard let presenter = presenter as? TTPTasksListPresenterProtocol else { return }
        presenter.searchTastk(with: searchText)
    }
    
    
}
