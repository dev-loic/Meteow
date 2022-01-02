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
    @IBOutlet private weak var currentTemperatureLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    // MARK: - ProfileSectionHeaderView

    func configure(with viewModel: CityHeaderViewModel) {
        cityNameLabel.text = viewModel.cityName
        currentTemperatureLabel.text = viewModel.currentTemperature
    }

    // MARK: - Private

    private func setUpViews() {
        setUpStackView()
        setUpLabels()
    }
    
    private func setUpStackView() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 8.0
    }
    
    private func setUpLabels() {
        [cityNameLabel, currentTemperatureLabel].forEach { $0.textAlignment = .center }
        cityNameLabel.font = .largeTitle
        currentTemperatureLabel.font = .extraLargeBoldTitle
    }
}
