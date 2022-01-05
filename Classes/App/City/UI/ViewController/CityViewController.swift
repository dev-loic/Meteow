//
//  CityViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class CityViewController: UIViewController {

    var presenter: CityPresenter?
    private lazy var tableView = self.createTableView()
    private lazy var dataSource = CityDataSource()

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter?.start()
    }
    
    // MARK: - Private
    
    private func setUpViews() {
        tableView.backgroundColor = .m_lightGray
        view.addSubview(tableView)
        tableView.ad_pinToSuperview()
        tableView.separatorStyle = .none
        dataSource.registerHeader(in: tableView)
        dataSource.registerCells(in: tableView)
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        return tableView
    }
}

extension CityViewController: CityViewContract {
    
    // MARK: - CityViewContract
    
    func display(_ viewModel: CityViewModel) {
        dataSource.configure(with: viewModel)
        tableView.reloadData()
    }
}
