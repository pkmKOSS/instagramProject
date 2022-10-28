//
//  ProfileInfoCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 23.10.2022.
//

import UIKit

/// Ячейка с информацией о профиле пользователя.
final class ProfileInfoCell: UITableViewCell {

    // MARK: private @IBOutlets

    @IBOutlet private weak var profileNameLabel: UILabel!
    @IBOutlet private weak var profileSpecNameLabel: UILabel!
    @IBOutlet private weak var aboutUserLabel: UILabel!
    @IBOutlet private weak var whoSubscribeLabel: UILabel!

    // MARK: public methods

    func configureCell(profileInfo: ProfileInfo) {
        profileNameLabel.text = "\(profileInfo.profileName ?? StringConstants.defaultString)"
        aboutUserLabel.text = "\(profileInfo.profileSubscription ?? StringConstants.defaultString)"
        whoSubscribeLabel.text = "подписан: \(profileInfo.whoSubscribe?.first ?? StringConstants.defaultString)"
    }
}
