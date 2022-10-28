//
//  ViewController.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 23.10.2022.
//

import UIKit

/// Экран поиска профиля.
final class SearchViewController: UIViewController {

    // MARK: Private enums

    private enum CellTypes: String {
        case profileCell = "ProfileCell"
        case profileInfoCell = "ProfileInfoCell"
        case storyTableViewCell = "StoryTableViewCell"
        case photoTableViewCell = "PhotoTableViewCell"
    }

    // MARK: Private properties

    private var profileInfo: ProfileInfo?
    private var currentIndex = 0
    private var cellTypes: [CellTypes] = [.profileCell, .profileInfoCell, .storyTableViewCell, .photoTableViewCell]

    // MARK: Private visual components

    @IBOutlet private weak var tableView: UITableView!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScene()
    }

    // MARK: Private methods

    private func configureScene() {
        createModel()
        registerCells()
        createDelegatesAndDataSource()
    }

    // MARK: Register Cells

    private func registerCells() {
        tableView.register(
            UINib(nibName: StringConstants.profileCellNibNameAndID, bundle: nil),
            forCellReuseIdentifier: StringConstants.profileCellNibNameAndID
        )
        tableView.register(
            UINib(nibName: StringConstants.profileInfoCellNibNameAndID, bundle: nil),
            forCellReuseIdentifier: StringConstants.profileInfoCellNibNameAndID
        )
        tableView.register(
            UINib(nibName: StringConstants.storyCellNibNameAndID, bundle: nil),
            forCellReuseIdentifier: StringConstants.storyCellNibNameAndID
        )
        tableView.register(
            UINib(nibName: StringConstants.photoCellNibNameAndID, bundle: nil),
            forCellReuseIdentifier: StringConstants.photoCellNibNameAndID
        )
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Private methods

    private func createModel() {
        profileInfo = ProfileInfo(
            avatarName: StringConstants.avatarName,
            numberOfPosts: 5,
            numberOfSubscribers: 236,
            numberOfSeubscribe: 9,
            profileName: StringConstants.profileName,
            profileSubscription: StringConstants.profileSubscription,
            whoSubscribe: [StringConstants.whoSubscribe],
            storysNames: [
                StringConstants.firstStoryName,
                StringConstants.secondStoryName,
                StringConstants.thirdStoryName
            ],
            photosNames: StringConstants.photoNames
        )
    }
}

// методы UITableViewDataSource и UITableViewDelegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellTypes[safe: indexPath.row]
        switch type {
        case .profileCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.profileCell.rawValue)
                    as? ProfileCell
            else { return UITableViewCell() }
            guard let model = profileInfo else { return UITableViewCell() }
            cell.configureCell(model: model)
            return cell
        case .profileInfoCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.profileInfoCell.rawValue)
                    as? ProfileInfoCell
            else { return UITableViewCell() }
            guard let model = profileInfo else { return UITableViewCell() }
            cell.configureCell(profileInfo: model)
            return cell
        case .storyTableViewCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.storyTableViewCell.rawValue)
                    as? StoryTableViewCell
            else { return UITableViewCell() }
            guard let model = profileInfo else { return UITableViewCell() }
            guard currentIndex < model.storysNames?.count ?? 0
            else {
                currentIndex = 0
                cell.configureCell(model: model, index: currentIndex)
                return cell
            }
            cell.configureCell(model: model, index: currentIndex)
            currentIndex += 1
            return cell
        case .photoTableViewCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.photoTableViewCell.rawValue)
                    as? PhotoTableViewCell
            else { return UITableViewCell() }
            guard let model = profileInfo else { return UITableViewCell() }
            guard currentIndex < model.storysNames?.count ?? 0
            else {
                currentIndex = 0
                cell.configureCell(model: model, index: currentIndex)
                return cell
            }
            cell.configureCell(model: model, index: currentIndex)
            currentIndex += 1
            return cell
        default:
            return UITableViewCell()
        }
    }
}
