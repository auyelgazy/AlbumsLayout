//
//  Album.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import Foundation

enum AlbumType {
    case horizontal
    case vertical
}

struct Album {
    let type: AlbumType
    let name: String
    let imageName: String
    let count: Int
}

extension Album {
    static let horizontalAlbums = [
        Album(type: .horizontal, name: "Recents", imageName: "image1", count: 483),
        Album(type: .horizontal, name: "Favorites", imageName: "image2", count: 9),
        Album(type: .horizontal, name: "Family", imageName: "image3", count: 123),
        Album(type: .horizontal, name: "Family", imageName: "image4", count: 40),
        Album(type: .horizontal, name: "Family", imageName: "image5", count: 55),
        Album(type: .horizontal, name: "Family", imageName: "image6", count: 38),
        Album(type: .horizontal, name: "Family", imageName: "image7", count: 2),
    ]

    static let verticalAlbums = [
        Album(type: .vertical, name: "Videos", imageName: "video", count: 153),
        Album(type: .vertical, name: "Selfies", imageName: "person.crop.square", count: 153),
        Album(type: .vertical, name: "Live Photos", imageName: "livephoto", count: 153),
        Album(type: .vertical, name: "Portrait", imageName: "cube", count: 153),
        Album(type: .vertical, name: "Panoramas", imageName: "pano", count: 153),
        Album(type: .vertical, name: "Time-lapse", imageName: "timelapse", count: 153),
        Album(type: .vertical, name: "Cinematic", imageName: "video.square", count: 153),
        Album(type: .vertical, name: "Screenshots", imageName: "camera.viewfinder", count: 153),
        Album(type: .vertical, name: "Animated", imageName: "square.stack.3d.forward.dottedline", count: 153),
        Album(type: .vertical, name: "RAW", imageName: "r.square.on.square", count: 153),
    ]
}
