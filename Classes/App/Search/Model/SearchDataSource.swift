//
//  SearchDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import ADUtils

protocol SearchDataSourceDelegate: AnyObject {
    func searchDataSource(_ dataSource: SearchDataSource, didSelectCityAt indexPath: IndexPath)
    func searchDataSource(_ dataSource: SearchDataSource, didCommitDeleteAt indexPath: IndexPath)
}

class SearchDataSource: NSObject {

    weak var delegate: SearchDataSourceDelegate?

    private var viewModel: SearchViewModel = .empty

    // MARK: - SearchDataSource

    func registerCells(in tableView: UITableView) {
        tableView.register(cell: .class(SearchResultTableViewCell.self))
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
            let cell: SearchResultTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        case let .favorite(cellViewModel):
            let cell: FavoriteTableViewCell = tableView.dequeueCell(at: indexPath)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let viewModel = viewModel.sections[indexPath.section].cells[indexPath.row]
        switch viewModel {
        case .searchResult:
            return false
        case .favorite:
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard case .delete = editingStyle else { return }
        delegate?.searchDataSource(self, didCommitDeleteAt: indexPath)
    }
}

extension SearchDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModel.sections[indexPath.section].cells[indexPath.row]
        guard case .searchResult = viewModel else { return }
        delegate?.searchDataSource(self, didSelectCityAt: indexPath)
    }
}
