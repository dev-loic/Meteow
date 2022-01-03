//
//  CityMoreDetailsCellCollectionViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import Foundation
import UIKit

class CityMoreDetailsCellCollectionViewCell: UICollectionViewCell {

    private lazy var stackView = UIStackView()
    private lazy var titleLabel = UILabel()
    private lazy var valueLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    // MARK: - CityMoreDetailsCellCollectionViewCell
    
    func configure(with viewModel: CityMoreDetailsCellViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
    
    // MARK: - Private
    
    private func setUp() {
        backgroundColor = .m_clear
        setUpStackView()
        setUpLabels()
    }
    
    private func setUpStackView() {
        contentView.addSubview(stackView)
        stackView.ad_pinToSuperview()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.ad_addArrangedSubviews([titleLabel, valueLabel])
    }
    
    private func setUpLabels() {
        [titleLabel, valueLabel].forEach {
            $0.textColor = .m_blackPure
            $0.font = .boldText
        }
    }
}
