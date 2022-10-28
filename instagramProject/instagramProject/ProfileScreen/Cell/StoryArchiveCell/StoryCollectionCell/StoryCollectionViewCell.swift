//
//  StoryCollectionViewCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 24.10.2022.
//

import UIKit

/// Ячейка с архивом историй.
final class StoryCollectionViewCell: UICollectionViewCell {

    // MARK: Private @IBOutlets

    @IBOutlet private weak var storysAvatarImageView: UIImageView!
    @IBOutlet private weak var storysNameLabel: UILabel!

    // MARK: Public methods

    func configureCell(profileInfo: ProfileInfo, index: Int) {
        storysNameLabel.text = profileInfo.storysNames?[index]
        storysAvatarImageView.image = UIImage(
            named: profileInfo.storysNames?[safe: index] ?? StringConstants.defaultString
        )
    }
}
