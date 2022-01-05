//
//  CityDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation
import UIKit
import ADUtils

class CityDataSource: NSObject {

    private var viewModel: CityViewModel = .empty
    private lazy var sizingHeader = CityHeaderView.ad_fromNib()

    // MARK: - CityDataSource

    func registerHeader(in tableView: UITableView) {
        tableView.register(header: .nib(CityHeaderView.self))
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.register(cell: .class(CityHoursDetailsTableViewCell.self))
        tableView.register(cell: .class(CityMoreDetailsTableViewCell.self))
    }

    func configure(with viewModel: CityViewModel) {
        self.viewModel = viewModel
    }
}

extension CityDataSource: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case let .hoursDetails(viewModel):
            let cell: CityHoursDetailsTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .moreDetails(viewModel):
            let cell: CityMoreDetailsTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: CityHeaderView = tableView.dequeueHeader()
        header.configure(with: viewModel.header)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sizingHeader.configure(with: viewModel.header)
        return sizingHeader.ad_preferredLayoutHeight(fittingWidth: tableView.m_fittingWidth)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellViewModel = viewModel.cells[indexPath.row]
        switch cellViewModel {
        case .hoursDetails:
            return 160.0
        case .moreDetails:
            return 290.0
        }
    }
}

extension CityDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
}
