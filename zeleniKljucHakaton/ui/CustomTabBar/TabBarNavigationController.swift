//
//  TabBarNavigationController.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//
import UIKit


protocol TabBarNavigationDelegate: AnyObject {
    func selectTab(_ navigationTab: NavigationTab)
}

class TabBarNavigationViewController: UITabBarController {
    private let tabBarFactory: TabBarViewControllerCreating
    
    init(tabBarFactory: TabBarViewControllerCreating) {
        self.tabBarFactory = tabBarFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        selectedIndex = 0
        self.navigationController?.tabBarItem.isAccessibilityElement = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            
            tabBarAppearance.backgroundColor = .white
            
            updateTabBarItemAppearance(appearance: tabBarAppearance.compactInlineLayoutAppearance)
            updateTabBarItemAppearance(appearance: tabBarAppearance.inlineLayoutAppearance)
            updateTabBarItemAppearance(appearance: tabBarAppearance.stackedLayoutAppearance)
            
            self.tabBar.standardAppearance = tabBarAppearance
            self.tabBar.clipsToBounds = true
            self.tabBar.scrollEdgeAppearance = tabBarAppearance
                    tabBar.layer.cornerRadius = 7
                    navigationItem.backButtonDisplayMode = .minimal
                    tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
        
        tabBarFactory.applyShadow(to: tabBar)
        let tabViewControllers = tabBarFactory.createNavigationControllers(for: NavigationTab.allCases, tabBarDelegate: self)
        viewControllers = tabViewControllers
    }
    
    private func updateTabBarItemAppearance(appearance: UITabBarItemAppearance) {
        let tintColor: UIColor = UIColor(named: "backgroundBlue")!
        let unselectedItemTintColor: UIColor = .gray
        appearance.selected.iconColor = tintColor
        appearance.normal.iconColor = unselectedItemTintColor
        appearance.selected.titleTextAttributes = [.foregroundColor: tintColor]
        appearance.normal.titleTextAttributes = [.foregroundColor: unselectedItemTintColor]
    }
}

extension TabBarNavigationViewController: TabBarNavigationDelegate {
    func selectTab(_ navigationTab: NavigationTab) {
        selectedIndex = navigationTab.rawValue
    }
}
