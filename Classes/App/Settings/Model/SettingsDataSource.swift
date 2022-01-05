//
//  SettingsDataSource.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

import UIKit

class SettingsDataSource: NSObject {

    private var viewModel: SettingsViewModel = .empty

    // MARK: - SettingsDataSource

    func configure(with viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
}

extension SettingsDataSource: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        var configuration = cell.defaultContentConfiguration()
        let cellViewModel = viewModel.sections[indexPath.section].cells[indexPath.row]
        configuration.text = cellViewModel.title
        configuration.secondaryText = cellViewModel.description
        cell.contentConfiguration = configuration
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension SettingsDataSource: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
}
