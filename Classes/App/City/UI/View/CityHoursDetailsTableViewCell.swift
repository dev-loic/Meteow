//
//  CityHoursDetailsTableViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

class CityHoursDetailsTableViewCell: UITableViewCell {
    
    private lazy var containerView = self.createContainerView()
    private lazy var collectionView = self.createCollectionView()
    private lazy var dataSource = CityHoursDetailsDataSource()
    private lazy var flowLayout = self.createFlowLayout()
    
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
        backgroundColor = .m_clear
        selectionStyle = .none
        setUpContainerView()
        setUpCollectionView()
    }
    
    private func setUpContainerView() {
        contentView.addSubview(containerView)
        containerView.ad_pinToSuperview(insets: UIEdgeInsets(horizontal: 24.0, vertical: 8.0))
    }
    
    private func setUpCollectionView() {
        containerView.addSubview(collectionView)
        collectionView.ad_pinToSuperview()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .m_clear
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.registerCells(in: collectionView)
    }
    
    private func createContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .m_white
        view.layer.cornerRadius = 12.0
        return view
    }
    
    private func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        return collectionView
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = .greatestFiniteMagnitude
        return flowLayout
    }
}
