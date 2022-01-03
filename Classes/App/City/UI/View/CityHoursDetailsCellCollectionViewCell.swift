//
//  CityHoursDetailsCellCollectionViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 03/01/2022.
//

import UIKit

class CityHoursDetailsCellCollectionViewCell: UICollectionViewCell {

    private lazy var stackView = UIStackView()
    private lazy var hourLabel = UILabel()
    private lazy var weatherIconImageView = UIImageView()
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
        hourLabel.text = viewModel.hour
        weatherIconImageView.image = viewModel.weatherIconImage?.withRenderingMode(.alwaysTemplate)
        temperatureLabel.text = viewModel.temperature
    }
    
    // MARK: - Private
    
    private func setUp() {
        backgroundColor = .m_clear
        setUpStackView()
        setUpLabels()
        setUpImageView()
    }
    
    private func setUpStackView() {
        contentView.addSubview(stackView)
        stackView.ad_pinToSuperview()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.ad_addArrangedSubviews([hourLabel, weatherIconImageView, temperatureLabel])
    }
    
    private func setUpLabels() {
        [hourLabel, temperatureLabel].forEach {
            $0.textColor = .m_blackPure
            $0.font = .boldText
        }
    }
    
    private func setUpImageView() {
        let configuration = UIImage.SymbolConfiguration(hierarchicalColor: .m_blackPure)
        weatherIconImageView.preferredSymbolConfiguration = configuration
        weatherIconImageView.heightAnchor.constraint(equalTo: weatherIconImageView.widthAnchor).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        weatherIconImageView.contentMode = .scaleAspectFit
    }
}
