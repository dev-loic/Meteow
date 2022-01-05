//
//  Alertable.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import Foundation
import UIKit

protocol Alertable {
    func presentAlert(_ viewModelType: AlertViewModelType, completion: @escaping (AlertHandlerActionType) -> Void)
}

enum AlertHandlerActionType {
    case cancel
    case confirm
    case delete
}

extension Alertable where Self: UIViewController {
    
    // MARK: - Alertable
    
    func presentAlert(_ viewModelType: AlertViewModelType, completion: @escaping (AlertHandlerActionType) -> Void) {
        switch viewModelType {
        case let .cancelable(viewModel):
            presentCancelableAlert(viewModel, completion: completion)
        case let .destructive(viewModel):
            presentDestructiveAlert(viewModel, completion: completion)
        }
    }
    
    // MARK: - Private
    
    private func presentCancelableAlert(_ viewModel: AlertViewModel,
                                        completion: @escaping (AlertHandlerActionType) -> Void) {
        let cancelAction = UIAlertAction(
            title: "alert_cancel_button_title".localized(),
            style: .cancel,
            handler: { _ in completion(.cancel) }
        )
        let confirmAction = UIAlertAction(
            title: "alert_confirm_button_title".localized(),
            style: .default,
            handler: { _ in completion(.confirm) }
        )
        presentAlert(
            title: viewModel.title,
            message: viewModel.message,
            actions: [cancelAction, confirmAction],
            completion: nil
        )
    }
    
    private func presentDestructiveAlert(_ viewModel: AlertViewModel,
                                         completion: @escaping (AlertHandlerActionType) -> Void) {
        let cancelAction = UIAlertAction(
            title: "alert_cancel_button_title".localized(),
            style: .cancel,
            handler: { _ in completion(.cancel) }
        )
        let confirmAction = UIAlertAction(
            title: "alert_delete_button_title".localized(),
            style: .destructive,
            handler: { _ in completion(.delete) }
        )
        presentAlert(
            title: viewModel.title,
            message: viewModel.message,
            actions: [cancelAction, confirmAction],
            completion: nil
        )
    }
    
    private func presentAlert(title: String?,
                              message: String?,
                              actions: [UIAlertAction],
                              completion: (() -> Void)?) {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        present(alertViewController, animated: true, completion: completion)
        actions.forEach { alertViewController.addAction($0) }
    }
}
