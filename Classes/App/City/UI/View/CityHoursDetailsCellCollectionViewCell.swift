//
//  CityHoursDetailsCellCollectionViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

class CityHoursDetailsCellCollectionViewCell: UICollectionViewCell {
    
    private lazy var temperatureLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    // MARK: - CityHoursDetailsCellCollectionViewCell
    
    func configure(with viewModel: CityHoursDetailsCellViewModel) {
        temperatureLabel.text = viewModel.temperature
    }
    
    // MARK: - Private
    
    private func setUp() {
        contentView.addSubview(temperatureLabel)
        temperatureLabel.ad_pinToSuperview()
    }
}
