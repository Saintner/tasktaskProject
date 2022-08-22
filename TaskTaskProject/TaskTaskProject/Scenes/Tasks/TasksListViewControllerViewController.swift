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
    func reloadTable(willShowLoader: Bool)
    func showAlertController()
}

final class TTPTasksListViewController: UIViewController {
    
    var presenter: TTPPresenter!
    
    private let searchController = UISearchController()
    
    private lazy var tasksTableView: UITableView = {
        let table = UITableView()
        table.register(TTPTasksSubtitleTableViewCell.self, forCellReuseIdentifier: TTPConstants.taskListTableViewCellReusableIdentifier)
        table.isHidden = true
        return table
    }()
    
    private lazy var loader = UIActivityIndicatorView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let presenter = presenter as? TTPTasksListPresenter else { return }
        presenter.viewDidLoad()
        setupSearchController()
        setupActivityIndicatorView()
        setupTasksTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.isUserInteractionEnabled = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        
    }
    
    private func setupTasksTableView() {
        view.addSubview(tasksTableView)
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-28)
            make.bottomMargin.equalTo(-40)
        }
    }
    
    private func setupActivityIndicatorView() {
        loader.transform = CGAffineTransform(scaleX: 3, y: 3)
        view.addSubview(loader)
        loader.startAnimating()
        loader.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
    }
    
    private func toggleLoader(){
        if loader.isHidden {
            tasksTableView.isHidden = true
            searchController.searchBar.isUserInteractionEnabled = false
            loader.isHidden = false
        }else {
            tasksTableView.isHidden = false
            searchController.searchBar.isUserInteractionEnabled = true
            loader.isHidden = true
        }
        view.layoutSubviews()
    }
}

extension TTPTasksListViewController: TTPTasksListView {
    func reloadTable(willShowLoader: Bool) {
        tasksTableView.reloadData()
        if willShowLoader {
            toggleLoader()
        }
    }
    
    func showAlertController() {
        let alert = UIAlertController(title: TTPConstants.somethingHappenedText, message: TTPConstants.somethingWentWrongText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: TTPConstants.tryAgainText, style: .default, handler: { _ in
            guard let presenter = self.presenter as? TTPTasksListPresenterProtocol else { return }
            presenter.viewDidLoad()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension TTPTasksListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = presenter as? TTPTasksListPresenter else { return 0 }
        return presenter.getTasksCount(with: searchController.isActive)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TTPConstants.taskListTableViewCellReusableIdentifier, for: indexPath)
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
