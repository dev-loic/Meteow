//
//  SearchViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }
}

extension SearchViewController: SearchViewContract {
    
    // MARK: - SearchViewContract
}
