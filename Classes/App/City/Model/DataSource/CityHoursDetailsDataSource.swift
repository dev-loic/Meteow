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
    private lazy var sizingCell = CityHoursDetailsCellCollectionViewCell()

    // MARK: - CityDataSource

    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(cell: .class(CityHoursDetailsCellCollectionViewCell.self))
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
        let cell: CityHoursDetailsCellCollectionViewCell = collectionView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.cells[indexPath.row])
        return cell
    }
}

extension CityHoursDetailsDataSource: UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
}

extension CityHoursDetailsDataSource: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 56.0
        let cellViewModel = viewModel.cells[indexPath.row]
        sizingCell.prepareForReuse()
        sizingCell.configure(with: cellViewModel)
        let height = sizingCell.contentView.ad_preferredLayoutHeight(fittingWidth: width)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(value: 8.0)
    }
}
