//
//  SceneDelegate.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 11.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = PhotosTabBarController()
        if let tabBarController = self.window?.rootViewController as? PhotosTabBarController {
            tabBarController.selectedIndex = 2
        }
        window?.makeKeyAndVisible()
    }
}

