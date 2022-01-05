//
//  FavoriteTableViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 04/01/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - SearchTableViewCell
    
    func configure(with viewModel: FavoriteCellViewModel) {
        var configuration = defaultContentConfiguration()
        configuration.text = viewModel.title
        configuration.secondaryText = viewModel.description
        contentConfiguration = configuration
    }
    
    // MARK: - Private
    
    private func setup() {
        // TODO: (Loic Saillant) 2021/12/30 To complete
    }
}
