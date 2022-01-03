//
//  CityHoursDetailsTableViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

class CityHoursDetailsTableViewCell: UITableViewCell {
    
    private lazy var collectionView = self.createCollectionView()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - CityHoursDetailsTableViewCell
    
    func configure(with viewModel: CityHoursDetailsViewModel) {
        // TODO: (Loic Saillant) To complete
    }
    
    // MARK: - Private
    
    private func setup() {
        // TODO: (Loic Saillant) To complete
    }
    
    private func createCollectionView() -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }
}
