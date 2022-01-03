//
//  CityMoreDetailsCellCollectionViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import Foundation
import UIKit

class CityMoreDetailsCellCollectionViewCell: UICollectionViewCell {

    private lazy var containerView = self.createContainerView()
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
    
    private func createContainerView() -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        view.layer.cornerRadius = 12.0
        view.backgroundColor = .m_lightGray
        return view
    }
    
    private func setUp() {
        backgroundColor = .m_clear
        setUpContainerView()
        setUpStackView()
        setUpLabels()
    }
    
    private func setUpContainerView() {
        contentView.addSubview(containerView)
        containerView.ad_pinToSuperview()
    }
    
    private func setUpStackView() {
        containerView.addSubview(stackView)
        stackView.ad_pinToSuperview(insets: UIEdgeInsets(value: 16.0))
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8.0
        stackView.ad_addArrangedSubviews([titleLabel, valueLabel])
    }
    
    private func setUpLabels() {
        [titleLabel, valueLabel].forEach { $0.textColor = .m_blackPure }
        titleLabel.font = .boldText
        valueLabel.font = .bigTitle
    }
}
