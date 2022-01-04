//
//  AppDelegate.swift
//  Meteow
//
//  Created by Loïc Saillant on 30/12/2021.
//

import UIKit
import ADUtils

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var tabBarController = UITabBarController()
    private lazy var controllers: [UINavigationController] = createControllers()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        tabBarController.tabBar.tintColor = .m_black
        tabBarController.view.backgroundColor = .m_white
        tabBarController.setViewControllers(controllers, animated: false)
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        return true
    }
    
    // MARK: - Private
    
    private func createControllers() -> [UINavigationController] {
        var controllers: [UINavigationController] = []
        
        // MARK: Search
        
        let searchNavigationController = createSearchNavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(
            title: "tab_search_title".localized(),
            image: .search,
            tag: 2
        )
        controllers.append(searchNavigationController)
        
        // MARK: Settings
        
        let settingsNavigationController = createSettingsNavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(
            title: "tab_settings_title".localized(),
            image: .settings,
            tag: 3
        )
        controllers.append(settingsNavigationController)

        return controllers
    }
    
    private func createSearchNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let viewController = SearchViewController()
        let searchRepository = SearchRepositoryImplementation()
        let citiesRepository = CitiesRepositoryImplementation()
        let presenter = SearchPresenterImplementation(
            viewContract: viewController,
            searchRepository: searchRepository,
            citiesRepository: citiesRepository
        )
        presenter.delegate = self
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
    
    private func createCitiesNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let viewController = CitiesViewController()
        let repository = CitiesRepositoryImplementation()
        let presenter = CitiesPresenterImplementation(viewContract: viewController, repository: repository)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
    
    private func createSettingsNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let viewController = SettingsViewController()
        let citiesRepository = CitiesRepositoryImplementation()
        let presenter = SettingsPresenterImplementation(viewContract: viewController, citiesRepository: citiesRepository)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
    
    private func appendCitiesNavigationControllerIfNeededAndDisplay() {
        guard !controllers.contains(where: { $0.viewControllers.first as? CitiesViewController != nil }) else {
            tabBarController.selectedIndex = 0
            return
        }
        let citiesNavigationController = createCitiesNavigationController()
        citiesNavigationController.tabBarItem = UITabBarItem(
            title: "tab_cities_title".localized(),
            image: .sun,
            tag: 1
        )
        controllers.insert(citiesNavigationController, at: 0)
        tabBarController.setViewControllers(controllers, animated: true)
        tabBarController.selectedIndex = 0
    }
}

extension AppDelegate: SearchPresenterDelegate {
    
    // MARK: - SearchPresenterDelegate
    
    func searchPresenter(_ presenter: SearchPresenter, didSelect city: City) {
        appendCitiesNavigationControllerIfNeededAndDisplay()
    }
}

