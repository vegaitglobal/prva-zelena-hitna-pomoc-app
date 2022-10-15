//
//  NavigationTab.swift
//  zeleniKljucHakaton
//
//  Created by Teodora Randjelovic on 10/14/22.
//

import UIKit

enum NavigationTab: Int, CaseIterable {
    case home = 0
    case news
    case partners
    case donations
    case contact
    
    func viewController(tabBarDelegate: TabBarNavigationDelegate) -> UIViewController {
        let presenter = UINavigationController()
        lazy var requestManager: RepositoryModule = RepositoryModule(manager: FirebaseManager())
        
        switch self {
        case .home:
            let coordinator = HomeCoordinator(presenter: presenter, manager: requestManager)
            coordinator.start()
            return coordinator.createViewController()
        case .news:
            let coordinator = NewsCoordinator(presenter: presenter, manager: requestManager)
            return coordinator.createViewController()
        case .partners:
            let coordinator = PartnersCoordinator(presenter: presenter, manager: requestManager)
            return coordinator.createViewController()
        case .donations:
            let coordinator = DonationsCoordinator(presenter: presenter, manager: requestManager)
            return coordinator.createViewController()
        case .contact:
            let coordinator = ContactCoordinator(presenter: presenter, manager: requestManager)
            return coordinator.createViewController()
        }
    }
        
        var title: String {
            switch self {
            case .home:
                return "Pocetna"
            case .news:
                return "Vesti"
            case .partners:
                return "Partneri"
            case .donations:
                return "Doniraj"
            case .contact:
                return "Kontakt"
            }
        }
        
        var icon: UIImage? {
            switch self {
            case .home:
                return UIImage(systemName: "person.fill")
            case .news:
                return UIImage(named: "Icon-news")
            case .partners:
                return UIImage(named: "Icon-partners")
            case .donations:
                return UIImage(named: "Icon-donate")
            case .contact:
                return UIImage(named: "Icon-contact")
            }
        }
        
        var selectedIcon: UIImage? {
            switch self {
            case .home:
                return UIImage(systemName: "person.fill")
            case .news:
                return UIImage(named: "Icon-news")
            case .partners:
                return UIImage(named: "Icon-partners")
            case .donations:
                return UIImage(named: "Icon-donate")
            case .contact:
                return UIImage(named: "Icon-contact")
            }
        }
    }
