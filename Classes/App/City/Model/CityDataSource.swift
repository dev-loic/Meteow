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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: CityHeaderView = tableView.dequeueHeader()
        header.configure(with: viewModel.header)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sizingHeader.configure(with: viewModel.header)
        return sizingHeader.ad_preferredLayoutHeight(fittingWidth: tableView.m_fittingWidth)
    }
}

extension CityDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
}
