//
//  Constants.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 20.03.2023.
//

import UIKit

enum LayoutConstants {

    // Horizontal section
    static let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    static let itemInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0)
    static let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1 / 1.8 * 2))
    static let groupInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
    static let horizontalSectionInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 30)
    static let horizontalHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(30))

    // Vertical section
    static let verticalSectionInsets = NSDirectionalEdgeInsets(top: 20, leading: 6, bottom: 0, trailing: 0)
    static let verticalHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(30))

    // Others
    static let collectionViewInsetForSection = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
}
