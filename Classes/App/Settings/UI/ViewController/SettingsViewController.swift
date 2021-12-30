//
//  SettingsViewController.swift
//  Meteow
//
//  Created by loic.saillant on 30/12/2021.
//
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    var presenter: SettingsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
    }
}

extension SettingsViewController: SettingsViewContract {
    
    // MARK: - SettingsViewContract
}
