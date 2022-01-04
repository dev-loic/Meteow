//
//  AlertViewModel.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation

enum AlertViewModelType {
    case cancelable(AlertViewModel)
    case destructive(AlertViewModel)
}

struct AlertViewModel {
    let title: String?
    let message: String? = nil
}
