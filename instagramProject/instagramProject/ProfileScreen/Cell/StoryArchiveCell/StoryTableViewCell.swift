//
//  StoryTableViewCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 23.10.2022.
//

import UIKit

/// Ячейка с архивом историй
final class StoryTableViewCell: UITableViewCell {

    // MARK: private properties

    private var currentIndex = 0
    private var model: ProfileInfo?
    private var indexOfRow: Int?

    // MARK: private visual components

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            UINib(nibName: StringConstants.storyCollectionCellNibNameAndID, bundle: nil),
            forCellWithReuseIdentifier: StringConstants.storyCollectionCellNibNameAndID
        )
    }

    // MARK: public methods

    func configureCell(model: ProfileInfo, index: Int) {
        self.model = model
        indexOfRow = index
        collectionView.reloadData()
    }
}

// методы UICollectionViewDelegate и UICollectionViewDataSource
extension StoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StringConstants.storyCollectionCellNibNameAndID,
            for: indexPath
        ) as? StoryCollectionViewCell else { return UICollectionViewCell()}
        guard let model = model else { return UICollectionViewCell() }

        guard currentIndex < model.storysNames?.count ?? 0
        else {
            currentIndex = 0
            cell.configureCell(model: model, index: currentIndex)
            return cell
        }

        cell.configureCell(model: model, index: currentIndex)
        currentIndex += 1
        return cell
    }
}
