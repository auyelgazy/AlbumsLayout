//
//  Album.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import Foundation

struct Album {
    let name: String
    let imageName: String
    let count: Int
}

extension Album {
    static let albums = [
        Album(name: "Recents", imageName: "image1", count: 483),
        Album(name: "Family", imageName: "image2", count: 9),
        Album(name: "Family", imageName: "image3", count: 123),
        Album(name: "Family", imageName: "image4", count: 40),
        Album(name: "Family", imageName: "image5", count: 55),
        Album(name: "Family", imageName: "image6", count: 38),
        Album(name: "Family", imageName: "image7", count: 2),
    ]
}
