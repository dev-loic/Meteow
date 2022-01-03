//
//  CityHoursDetailsTableViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

class CityHoursDetailsTableViewCell: UITableViewCell {
    
    private lazy var collectionView = self.createCollectionView()
    private lazy var dataSource = CityHoursDetailsDataSource()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    // MARK: - CityHoursDetailsTableViewCell
    
    func configure(with viewModel: CityHoursDetailsViewModel) {
        dataSource.configure(with: viewModel)
        collectionView.reloadData()
    }
    
    // MARK: - Private
    
    private func setUp() {
        contentView.addSubview(collectionView)
        collectionView.ad_pinToSuperview(insets: UIEdgeInsets(horizontal: 24.0, vertical: 16.0))
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.registerCells(in: collectionView)
    }
    
    private func createCollectionView() -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = .greatestFiniteMagnitude
        let collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: flowLayout)
        return collectionView
    }
}
