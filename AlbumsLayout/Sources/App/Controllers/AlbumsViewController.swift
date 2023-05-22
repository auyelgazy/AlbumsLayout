//
//  AlbumsViewController.swift
//  AlbumsLayout
//
//  Created by Kuanysh al-Khattab Auyelgazy on 15.03.2023.
//

import UIKit
import SnapKit

final class AlbumsViewController: UIViewController {

    private let albums: [[Album]]

    // MARK: - Initializers

    init(albums: [[Album]] = [Album.horizontalAlbums, Album.verticalAlbums]) {
        self.albums = albums
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Elements

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumHorizontalCollectionViewCell.self, forCellWithReuseIdentifier: AlbumHorizontalCollectionViewCell.identifier)
        collectionView.register(AlbumVerticalCollectionViewCell.self, forCellWithReuseIdentifier: AlbumVerticalCollectionViewCell.identifier)
        collectionView.register(AlbumHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Albums"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.trailing.bottom.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }

    // MARK: - Actions

    @objc
    private func addPressed() {
        print("add new album")
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let layoutItem = NSCollectionLayoutItem(layoutSize: LayoutConstants.itemSize)
                layoutItem.contentInsets = LayoutConstants.itemInsets
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: LayoutConstants.groupSize, repeatingSubitem: layoutItem, count: 2)
                layoutGroup.contentInsets = LayoutConstants.groupInsets
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = LayoutConstants.horizontalSectionInsets
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                let layoutSectionHeaderSize = LayoutConstants.horizontalHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                                      elementKind: UICollectionView.elementKindSectionHeader,
                                                                                      alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            } else {
                let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
                let layoutSection = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment:layoutEnvironment)
                layoutSection.contentInsets = LayoutConstants.verticalSectionInsets
                let layoutSectionHeaderSize = LayoutConstants.verticalHeaderSize
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize,
                                                                                      elementKind: UICollectionView.elementKindSectionHeader,
                                                                                      alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
}

// MARK: - Extensions
extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return albums.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? albums[0].count : albums[1].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if albums[indexPath.section][indexPath.row].type == .horizontal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumHorizontalCollectionViewCell.identifier, for: indexPath) as! AlbumHorizontalCollectionViewCell
            cell.album = albums[indexPath.section][indexPath.row]
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumVerticalCollectionViewCell.identifier, for: indexPath) as! AlbumVerticalCollectionViewCell
            cell.album = albums[indexPath.section][indexPath.row]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return LayoutConstants.collectionViewInsetForSection
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumHeader.identifier, for: indexPath) as! AlbumHeader
        header.title.text = albums[indexPath.section][indexPath.row].type == .horizontal ? "My Albums" : "Media Types"
        return header
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = albums[indexPath.section][indexPath.row]
        print("item name: \(album.name), count: \(album.count)")
    }
}
