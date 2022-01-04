//
//  SearchDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import ADUtils

protocol SearchDataSourceDelegate: AnyObject {
    func searchDataSource(_ dataSource: SearchDataSource, didSelectCityAt index: Int)
}

class SearchDataSource: NSObject {

    weak var delegate: SearchDataSourceDelegate?

    private var viewModel: SearchViewModel = .empty

    // MARK: - SearchDataSource

    func registerCells(in tableView: UITableView) {
        tableView.register(cell: .class(SearchTableViewCell.self))
        tableView.register(cell: .class(FavoriteTableViewCell.self))
    }

    func configure(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

extension SearchDataSource: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.sections[indexPath.section].cells[indexPath.row]
        switch viewModel {
        case let .searchResult(cellViewModel):
            let cell: SearchTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        case let .favorite(cellViewModel):
            let cell: FavoriteTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
        
    }
}

extension SearchDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.searchDataSource(self, didSelectCityAt: indexPath.row)
    }
}
