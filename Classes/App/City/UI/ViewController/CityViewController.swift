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
    private lazy var tableView = UITableView()
    private lazy var dataSource = CityDataSource()

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter?.start()
    }
    
    // MARK: - Private
    
    private func setUpViews() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        view.addSubview(tableView)
        tableView.ad_pinToSuperview()
    }
}

extension CityViewController: CityViewContract {
    
    // MARK: - CityViewContract
    
    func display(_ viewModel: CityViewModel) {
        // TODO: (Loic Saillant) 2022/01/02 To implement        
    }
}
