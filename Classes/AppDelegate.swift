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
    private lazy var controllers: [UINavigationController] = createControllers()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let viewController = UITabBarController()
        viewController.tabBar.tintColor = .m_black
        viewController.view.backgroundColor = .m_white
        viewController.setViewControllers(controllers, animated: false)
        
        window.rootViewController = viewController
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
            tag: 1
        )
        controllers.append(searchNavigationController)
        
        // MARK: Cities
        
        let citiesNavigationController = createCitiesNavigationController()
        citiesNavigationController.tabBarItem = UITabBarItem(
            title: "tab_cities_title".localized(),
            image: .sun,
            tag: 2
        )
        controllers.append(citiesNavigationController)
        
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
        let presenter = SettingsPresenterImplementation(viewContract: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return navigationController
    }
}

