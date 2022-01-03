//
//  CityHoursDetailsDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import Foundation
import UIKit

class CityHoursDetailsDataSource: NSObject {

    private var viewModel: CityHoursDetailsViewModel = .empty

    // MARK: - CityDataSource

    func registerCells(in collectionView: UITableView) {
        // TODO: (Loic Saillant) 2022/01/03 To complete
    }

    func configure(with viewModel: CityHoursDetailsViewModel) {
        self.viewModel = viewModel
    }
}

extension CityHoursDetailsDataSource: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: (Loic Saillant) 2022/01/03 To complete
        return UICollectionViewCell()
    }
}

extension CityHoursDetailsDataSource: UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
}
