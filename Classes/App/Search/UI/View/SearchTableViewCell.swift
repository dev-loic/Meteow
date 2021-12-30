//
//  SearchTableViewCell.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import UIKit

protocol SearchTableViewCellDelegate: AnyObject {
    // TODO: (Loic Saillant) To complete
}

class SearchTableViewCell: UITableViewCell {
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - SearchTableViewCell
    
    func configure(with viewModel: SearchCellViewModel) {
        textLabel?.text = viewModel.title
    }
    
    // MARK: - Private
    
    private func setup() {
        // TODO: (Loic Saillant) 2021/12/30 To complete
    }
}
