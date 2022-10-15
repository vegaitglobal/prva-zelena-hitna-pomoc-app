//
//  TabBarViewControllerFactory.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

protocol TabBarViewControllerCreating {
    func createNavigationControllers(for tabs: [NavigationTab], tabBarDelegate: TabBarNavigationDelegate) -> [UIViewController]
    func applyShadow(to view: UIView?)
}

class TabBarViewControllerFactory: TabBarViewControllerCreating {
    private let appDelegate: AppDelegate
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    func createNavigationControllers(for tabs: [NavigationTab], tabBarDelegate: TabBarNavigationDelegate) -> [UIViewController] {
        let viewControllers: [UIViewController] = tabs.map { tab in
            let viewController = tab.viewController(tabBarDelegate: tabBarDelegate)
            let navigationController = UINavigationController(rootViewController: viewController)
            
            configureViewControllerProperties(for: viewController)
            styleTabBarItem(navigationController.tabBarItem, title: tab.title, image: tab.icon, selectedImage: tab.selectedIcon)
            configureNavigationItem(for: viewController, title: tab.title)
            return navigationController
        }
        
        return viewControllers
    }
    
    private func configureViewControllerProperties(for viewController: UIViewController) {
        
    }
    
    private func styleTabBarItem(_ item: UITabBarItem, title: String, image: UIImage?, selectedImage: UIImage?) {
        item.title = title.uppercased()
        item.image = image?.withRenderingMode(.alwaysTemplate)
        item.selectedImage = selectedImage?.withRenderingMode(.alwaysTemplate)
        item.selectedImage?.withTintColor(.white)
    }
    
    private func configureNavigationItem(for viewController: UIViewController, title: String) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backButtonTitle = nil
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
    }
    
    func applyShadow(to view: UIView?) {
        guard let view = view else { return }
        view.layer.masksToBounds = false
    }
}
