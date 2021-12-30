//
//  SearchDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import ADUtils

protocol SearchDataSourceDelegate: AnyObject {
    // TODO: (Loic Saillant) 2021/12/30 To complete
}

class SearchDataSource: NSObject {

    weak var delegate: SearchDataSourceDelegate?

    private var viewModel: SearchViewModel = .empty

    // MARK: - SearchDataSource

    func registerCells(in tableView: UITableView) {
        tableView.register(cell: .class(SearchTableViewCell.self))
    }

    func configure(with viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

extension SearchDataSource: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchTableViewCell = tableView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.cells[indexPath.row])
        return cell
    }
}

extension SearchDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
}
