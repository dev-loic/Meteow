//
//  CityViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class CityViewController: UIViewController {

    var presenter: CityPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }
}

extension CityViewController: CityViewContract {
    
    // MARK: - CityViewContract
}
