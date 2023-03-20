//
//  AlbumCollectionViewCell.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import UIKit
import SnapKit

final class AlbumVerticalCollectionViewCell: UICollectionViewCell {

    static let identifier = "AlbumVerticalCell"

    var album: Album? {
        didSet {
            guard let album = album else { return print("Album has no value") }
            albumName.text = album.name
            albumCount.text = String(album.count)
            albumImage.image = UIImage(systemName: album.imageName)
        }
    }

    // MARK: - UI Elements

    private lazy var imageContainer: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var albumName: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 20)
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
        imageContainer.addSubview(albumImage)
        contentView.addSubviews(imageContainer, albumName, albumCount)
    }

    private func setupConstraints() {
        imageContainer.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        albumImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(2)
            $0.trailing.bottom.equalToSuperview().offset(-2)
            $0.centerY.equalToSuperview()
        }

        albumName.snp.makeConstraints {
            $0.leading.equalTo(imageContainer.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }

        albumCount.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        album = nil
    }
}
