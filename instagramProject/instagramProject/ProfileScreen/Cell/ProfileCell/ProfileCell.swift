//
//  TableViewCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 23.10.2022.
//

import UIKit

/// Ячейка с информацией о профиле.
final class ProfileCell: UITableViewCell {

    // MARK: private visual components
    
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var numberOfPostsLabel: UILabel!
    @IBOutlet private weak var numberOfSubscriberLabel: UILabel!
    @IBOutlet private weak var numberOfSubscribeLabel: UILabel!

    // MARK: public methods

    func configureCell(model: ProfileInfo) {
        avatarImageView.image = UIImage(named: "\(model.avatarName ?? StringConstants.defaultString)") ?? UIImage()
        numberOfPostsLabel.text = "\(model.numberOfPosts ?? 0)"
        numberOfSubscriberLabel.text = "\(model.numberOfSubscribers ?? 0)"
        numberOfSubscribeLabel.text = "\(model.numberOfSeubscribe ?? 0)"
    }
}
