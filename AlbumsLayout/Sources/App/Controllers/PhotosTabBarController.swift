//
//  TabBarController.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import UIKit

final class PhotosTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let libraryVC = LibraryViewController()
        let forYouVC = LibraryViewController()
        let albumsVC = AlbumsViewController()
        let searchVC = LibraryViewController()

        libraryVC.navigationItem.largeTitleDisplayMode = .automatic
        forYouVC.navigationItem.largeTitleDisplayMode = .automatic
        albumsVC.navigationItem.largeTitleDisplayMode = .automatic
        searchVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: libraryVC)
        let nav2 = UINavigationController(rootViewController: forYouVC)
        let nav3 = UINavigationController(rootViewController: albumsVC)
        let nav4 = UINavigationController(rootViewController: searchVC)

        nav1.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.on.rectangle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "For You", image: UIImage(systemName: "newspaper.fill"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        let navigations = [nav1, nav2, nav3, nav4]
        for nav in navigations {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers(navigations, animated: true)
    }
}
