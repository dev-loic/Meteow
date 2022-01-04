//
//  CityHeaderView.swift
//  Meteow
//
//  Created by Loïc Saillant on 02/01/2022.
//

import UIKit

class CityHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet private weak var currentTemperatureLabel: UILabel!
    @IBOutlet private weak var explanationLabel: UILabel!
    @IBOutlet private weak var weatherIconImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    // MARK: - ProfileSectionHeaderView

    func configure(with viewModel: CityHeaderViewModel) {
        cityNameLabel.text = viewModel.cityName
        countryNameLabel.text = viewModel.countryName
        currentTemperatureLabel.text = viewModel.currentTemperature
        explanationLabel.text = viewModel.explanation
        weatherIconImageView.image = viewModel.weatherIconImage?.withRenderingMode(.alwaysTemplate)
    }

    // MARK: - Private

    private func setUpViews() {
        setUpStackView()
        setUpLabels()
        setUpImageView()
    }
    
    private func setUpStackView() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 8.0
        stackView.alignment = .center
    }
    
    private func setUpLabels() {
        [cityNameLabel, currentTemperatureLabel].forEach {
            $0?.textColor = .m_black
        }
        [explanationLabel, countryNameLabel].forEach {
            $0?.font = .text
            $0?.textColor = .m_gray
        }
        countryNameLabel.textColor = .m_gray
        cityNameLabel.font = .largeTitle
        cityNameLabel.numberOfLines = 1
        cityNameLabel.minimumScaleFactor = 0.5
        cityNameLabel.adjustsFontSizeToFitWidth = true
        currentTemperatureLabel.font = .extraLargeBoldTitle
    }
    
    private func setUpImageView() {
        let configuration = UIImage.SymbolConfiguration(hierarchicalColor: .m_gray)
        weatherIconImageView.preferredSymbolConfiguration = configuration
    }
}
