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
    private lazy var pageViewController = createPageViewController()
    private var controllers: [UIViewController] = []
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        presenter?.start()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.refreshIfNeeded()
    }
    
    // MARK: - Private
    
    private func createPageViewController() -> UIPageViewController {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .vertical)
        viewController.dataSource = self
        viewController.delegate = self
        return viewController
    }
    
    private func setUpViews() {
        navigationController?.isNavigationBarHidden = true
        addChild(pageViewController)
        pageViewController.view.frame = view.frame
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.view.backgroundColor = .m_lightGray
    }
}

extension CitiesViewController: CitiesViewContract {
    
    // MARK: - CitiesViewContract
    
    func display(_ viewModel: CitiesViewModel) {
        controllers = viewModel.controllers
        pageViewController.setViewControllers(
            [viewModel.controllers[0]],
            direction: .forward,
            animated: false
        )
    }
}

extension CitiesViewController: UIPageViewControllerDataSource {
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        if index > 0 {
            return controllers[index - 1]
        } else if controllers.count > 1 {
            return controllers[controllers.count - index - 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        if index < controllers.count - 1 {
            return controllers[index + 1]
        } else if controllers.count > 1 {
            return controllers[controllers.count - index - 1]
        } else {
            return nil
        }
    }
}

extension CitiesViewController: UIPageViewControllerDelegate {

    // MARK: - UIPageViewControllerDelegate

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
