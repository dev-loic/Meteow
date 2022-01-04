//
//  SearchViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class SearchViewController: UIViewController, Alertable {
    
    var presenter: SearchPresenter?
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    private lazy var dataSource = self.createDataSource()
    private lazy var placeholderBackgroundLabel = self.createPlaceholderBackgroundLabel()
    private lazy var placeholderBackgroundView = self.createPlaceholderBackgroundView()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.start()
    }

    // MARK: - Private
    
    private func createDataSource() -> SearchDataSource {
        let dataSource = SearchDataSource()
        dataSource.delegate = self
        return dataSource
    }
    
    private func setUpViews() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "search_navigation_bar_title".localized()
        view.backgroundColor = .m_lightGray
        dataSource.registerCells(in: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.backgroundColor = .m_clear
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "search_bar_placeholder".localized()
        searchBar.delegate = self
    }
    
    private func createPlaceholderBackgroundLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .text
        label.textColor = .m_gray
        label.numberOfLines = 0
        return label
    }
    
    private func createPlaceholderBackgroundView() -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .m_clear
        backgroundView.addSubview(placeholderBackgroundLabel)
        placeholderBackgroundLabel.ad_pinToSuperview(insets: UIEdgeInsets(horizontal: 48.0, vertical: 0.0))
        return backgroundView
    }
}

extension SearchViewController: SearchViewContract {
    
    // MARK: - SearchViewContract
    
    func display(_ viewModel: SearchViewModel) {
        setUpBackgroundView(viewModel.placeholderBackground)
        dataSource.configure(with: viewModel)
        tableView.reloadData()
    }
    
    // MARK: - Private
    
    private func setUpBackgroundView(_ backgroundViewModel: PlaceholderBackgroundViewModel?) {
        guard let backgroundViewModel = backgroundViewModel else {
            tableView.backgroundView = nil
            return
        }
        placeholderBackgroundLabel.text = backgroundViewModel.text
        tableView.backgroundView = placeholderBackgroundView
    }
}

extension SearchViewController: SearchDataSourceDelegate {
    
    // MARK: - SearchDataSourceDelegate
    
    func searchDataSource(_ dataSource: SearchDataSource, didSelectCityAt indexPath: IndexPath) {
        let alertViewModel = AlertViewModel(title: "search_add_favorite_title".localized())
        presentAlert(.cancelable(alertViewModel)) { [weak self] actionType in
            guard actionType == .confirm else { return }
            // TODO: (Loic Saillant) 2022/01/04 Should be done properly in presenter
            self?.presenter?.selectCity(at: indexPath.row)
            self?.searchBar.resignFirstResponder()
            self?.searchBar.text = ""
        }
    }
    
    func searchDataSource(_ dataSource: SearchDataSource, didCommitDeleteAt indexPath: IndexPath) {
        let alertViewModel = AlertViewModel(title: "search_delete_favorite_title".localized())
        presentAlert(.destructive(alertViewModel)) { [weak self] actionType in
            guard actionType == .delete else { return }
            // TODO: (Loic Saillant) 2022/01/04 Should be done properly in presenter
            self?.presenter?.removeFavorite(at: indexPath.row)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // ???: (Loic Saillant) 2021/12/30 I choose not to send a request at each letter,
        // like a true autocomplete because I am limited to 50 calls/day with free plan
        guard let query = searchBar.text else { return }
        searchBar.resignFirstResponder()
        presenter?.search(query)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.clearSearch()
    }
}
