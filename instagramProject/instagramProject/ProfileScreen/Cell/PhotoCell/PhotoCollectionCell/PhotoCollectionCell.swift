//
//  PhotoCollectionCell.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 24.10.2022.
//

import UIKit

/// Ячейка с фотографиями.
class PhotoCollectionCell: UICollectionViewCell {

    // MARK: private visual components

    @IBOutlet private weak var photoImageVIew: UIImageView!

    // MARK: public methods

    func configureCell(model: ProfileInfo, index: Int) {
        photoImageVIew.image = UIImage(named: model.photosNames?[index] ?? StringConstants.defaultString) ?? UIImage()
    }
}
