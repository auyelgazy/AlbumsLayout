//
//  AlbumCollectionViewCell.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import UIKit
import SnapKit

final class AlbumCollectionViewCell: UICollectionViewCell {

    static let identifier = "AlbumCell"

    var album: Album? {
        didSet {
            guard let album = album else { return }
            albumName.text = album.name
            albumCount.text = String(album.count)
            albumImage.image = UIImage(named: album.imageName)
        }
    }

    // MARK: - UI Elements

    private lazy var albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var albumName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    private lazy var albumCount: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18)
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubviews(albumImage, albumName, albumCount)
    }

    private func setupConstraints() {
        albumImage.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
//            $0.height.equalTo(200)
        }

        albumName.snp.makeConstraints {
            $0.top.equalTo(albumImage.snp.bottom)
        }

        albumCount.snp.makeConstraints {
            $0.top.equalTo(albumName.snp.bottom)
        }
    }
}

// MARK: - Extensions

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
