//
//  CityDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import Foundation
import UIKit

class CityDataSource: NSObject {

    private var viewModel: CityViewModel = .empty

    // MARK: - CityDataSource

    func registerCells(in tableView: UITableView) {
        // TODO: (Loic Saillant) 2022/01/02 To complete
    }

    func configure(with viewModel: CityViewModel) {
        self.viewModel = viewModel
    }
}

extension CityDataSource: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: (Loic Saillant) 2022/01/02 To complete
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: (Loic Saillant) 2022/01/02 To complete
        return UITableViewCell()
    }
}

extension CityDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
}
