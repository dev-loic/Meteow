//
//  SettingsViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    var presenter: SettingsPresenter?
    private lazy var tableView = self.createTableView()
    private lazy var dataSource = self.createDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.start()
    }
    
    // MARK: - Private
    
    private func setUpViews() {
        navigationItem.title = "settings_navigation_bar_title".localized()
        view.addSubview(tableView)
        tableView.ad_pinToSuperview()
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        return tableView
    }
    
    private func createDataSource() -> SettingsDataSource {
        let dataSource = SettingsDataSource()
        dataSource.delegate = self
        return dataSource
    }
}

extension SettingsViewController: SettingsViewContract {
    
    // MARK: - SettingsViewContract
    
    func display(_ viewModel: SettingsViewModel) {
        dataSource.configure(with: viewModel)
        tableView.reloadData()
    }
}

extension SettingsViewController: SettingsDataSourceDelegate {

    // MARK: - SettingsDataSourceDelegate
    
    func settingsDataSource(_ dataSource: SettingsDataSource, didCommitDeleteAt indexPath: IndexPath) {
        presenter?.removeFavorite(at: indexPath.row)
    }
}
