//
//  PhotoTableViewCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 24.10.2022.
//

import UIKit

/// Ячейка с коллекцией, содержащей фотографии.
final class PhotoTableViewCell: UITableViewCell {

    // MARK: private properties

    private var currentIndex = 0
    private var profileInfo: ProfileInfo?
    private var refreshControl = UIRefreshControl()
    
    // MARK: private @IBOutlet

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureScene()
    }

    // MARK: public methods

    func configureCell(model: ProfileInfo, index: Int) {
        self.profileInfo = model
        collectionView.reloadData()
    }

    // MARK: - private methods

    private func configureScene() {
        createRefreshControll()
        registerCell()
        createDelegatesAndDataSource()
    }

    private func createDelegatesAndDataSource() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func createRefreshControll() {
        collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshTableViewAcrion), for: .allEvents)
    }

    private func registerCell() {
        collectionView.register(
            UINib(nibName: StringConstants.photoCollectionCellNibNameAndID, bundle: nil),
            forCellWithReuseIdentifier: StringConstants.photoCollectionCellNibNameAndID
        )
    }

    @objc private func refreshTableViewAcrion() {
        var randomNames: [String] = []
        for _ in 0...2 {
            guard let element = profileInfo?.photosNames?.randomElement() else { return }
            randomNames.append(element)
        }
        profileInfo?.photosNames?.append(contentsOf: randomNames)
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - UICollectionViewDelegate и UICollectionViewDataSource
extension PhotoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: StringConstants.photoCollectionCellNibNameAndID,
                    for: indexPath
                ) as? PhotoCollectionCell
            else { return UICollectionViewCell()}
            if let model = profileInfo {
                guard currentIndex < model.photosNames?.count ?? 0
                else {
                    currentIndex = 0
                    cell.configureCell(model: model, index: currentIndex)
                    return cell
                }
                cell.configureCell(model: model, index: currentIndex)
                currentIndex += 1
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 25
        default:
            return 0
        }
    }
}
