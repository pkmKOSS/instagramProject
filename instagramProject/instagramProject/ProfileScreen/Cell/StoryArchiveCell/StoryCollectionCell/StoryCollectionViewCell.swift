//
//  StoryCollectionViewCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 24.10.2022.
//

import UIKit

/// Ячейка с архивом историй.
final class StoryCollectionViewCell: UICollectionViewCell {

    // MARK: Private visual components

    @IBOutlet private weak var storysAvatarImageView: UIImageView!
    @IBOutlet private weak var storysNameLabel: UILabel!

    // MARK: Public methods

    func configureCell(model: ProfileInfo, index: Int) {
        storysNameLabel.text = model.storysNames?[index]
        storysAvatarImageView.image = UIImage(named: model.storysNames?[index] ?? StringConstants.defaultString)
    }
}
