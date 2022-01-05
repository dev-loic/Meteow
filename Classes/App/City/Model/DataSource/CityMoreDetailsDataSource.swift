//
//  CityMoreDetailsDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

private enum Constants {
    static let interitemSpacing: CGFloat = 16.0
    static let  nbElementsPerRow: CGFloat = 2.0
}

class CityMoreDetailsDataSource: NSObject {

    private var viewModel: CityMoreDetailsViewModel = .empty
    private lazy var sizingCell = CityMoreDetailsCellCollectionViewCell()

    // MARK: - CityDataSource

    func registerCells(in collectionView: UICollectionView) {
        collectionView.register(cell: .class(CityMoreDetailsCellCollectionViewCell.self))
    }

    func configure(with viewModel: CityMoreDetailsViewModel) {
        self.viewModel = viewModel
    }
}

extension CityMoreDetailsDataSource: UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CityMoreDetailsCellCollectionViewCell = collectionView.dequeueCell(at: indexPath)
        cell.configure(with: viewModel.cells[indexPath.row])
        return cell
    }
}

extension CityMoreDetailsDataSource: UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDelegate
}

extension CityMoreDetailsDataSource: UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fittingWidth = collectionView.m_fittingWidth(with: collectionViewLayout, sizeForItemAt: indexPath)
        let width = (fittingWidth - Constants.interitemSpacing) / Constants.nbElementsPerRow
        let cellViewModel = viewModel.cells[indexPath.row]
        sizingCell.prepareForReuse()
        sizingCell.configure(with: cellViewModel)
        let height = sizingCell.contentView.ad_preferredLayoutHeight(fittingWidth: width)
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.interitemSpacing
    }
}
