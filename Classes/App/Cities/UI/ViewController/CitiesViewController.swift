//
//  CitiesViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class CitiesViewController: UIViewController {

    var presenter: CitiesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }
}

extension CitiesViewController: CitiesViewContract {
    
    // MARK: - CitiesViewContract
}
