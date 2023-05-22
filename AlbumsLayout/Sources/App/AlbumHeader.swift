//
//  AlbumHeader.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 16.03.2023.
//

import UIKit

final class AlbumHeader: UICollectionReusableView {

    static let identifier = "AlbumHeader"

    // MARK: - UI Elements

    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .bold)
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
        addSubview(title)
    }

    private func setupConstraints() {
        title.snp.makeConstraints {
            $0.bottom.equalTo(self)
            $0.left.equalTo(self)
        }
    }
}
