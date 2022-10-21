//
//  TableViewController.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 20.10.2022.
//

import UIKit

/// Экран действий.
final class ActionScreenTableViewController: UITableViewController {

    // MARK: - Private types

    private enum SectionTypes: Int {
        case today = 0
        case yesterday = 1
        case lastWeek = 2
    }

    private enum CellTypes: String {
        case commentCellID = "commentScreen"
        case recomendCellID = "recomendedPerson"
        case requestToSubscribeCellID = "requestToSubscribe"
        case likeVideoCellID = "likeVideoCell"
        case subscribeCellID = "subscribeCell"
    }

    // MARK: private @IBOutlets

    @IBOutlet private var historyTableView: UITableView!
    
    // MARK: Private properties
    private let tableRefreshControll = UIRefreshControl()

    private var sectionTypes: [SectionTypes] = [.today, .yesterday, .lastWeek]

    private var todayCellTypes: [CellTypes] = [
        .commentCellID,
        .commentCellID,
        .subscribeCellID,
        .likeVideoCellID,
        .recomendCellID,
        .subscribeCellID,
        .likeVideoCellID,
        .recomendCellID
    ]

    private var yesterdayCellTypes: [CellTypes] = [
        .recomendCellID,
        .likeVideoCellID,
        .subscribeCellID,
        .commentCellID,
    ]

    private var lastWeekCellTypes: [CellTypes] = [
        .commentCellID,
        .commentCellID,
        .likeVideoCellID,
        .recomendCellID,
        .commentCellID,
        .recomendCellID,
        .likeVideoCellID,
        .recomendCellID
    ]

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    // MARK: - private methods

    private func configureViews() {
        self.refreshControl = tableRefreshControll
        navigationController?.navigationBar.prefersLargeTitles = true
        tableRefreshControll.addTarget(self, action: #selector(loadNewMessages), for: .valueChanged)
    }

    // MARK: - @objc private methods

    @objc private func loadNewMessages(sender: UIRefreshControl) {
        guard let randomMessage = todayCellTypes.randomElement() else { return }
        todayCellTypes.append(randomMessage)
        print("\(todayCellTypes.count)")
        tableView.reloadData()
        sender.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = sectionTypes[section]
        switch type {
        case .today:
            return todayCellTypes.count
        case .yesterday:
            return yesterdayCellTypes.count
        case .lastWeek:
            return lastWeekCellTypes.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sectionTypes[indexPath.section]

        switch sectionType {
        case .today:
            let cell = putCellInSection(types: todayCellTypes, row: indexPath.row)
            return cell
        case .yesterday:
            let cell = putCellInSection(types: yesterdayCellTypes, row: indexPath.row)
            return cell
        case .lastWeek:
            let cell = putCellInSection(types: lastWeekCellTypes, row: indexPath.row)
            return cell
        }
    }

    private func putCellInSection(types: [CellTypes], row: Int) -> UITableViewCell {
        let cellType = types.reversed()[row]

        switch cellType {
        case .commentCellID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.commentCellID.rawValue)
            else { return UITableViewCell() }
            return cell
        case .recomendCellID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.recomendCellID.rawValue)
            else { return UITableViewCell() }
            return cell
        case .requestToSubscribeCellID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.requestToSubscribeCellID.rawValue)
            else { return UITableViewCell() }
            return cell
        case .likeVideoCellID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.likeVideoCellID.rawValue)
            else { return UITableViewCell() }
            return cell
        case .subscribeCellID:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.subscribeCellID.rawValue)
            else { return UITableViewCell() }
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)

        switch sectionTypes[section] {
        case .today:
            label.text = StringConstants.todayLabelText
        case .yesterday:
            label.text = StringConstants.yesterdayLabelText
        case .lastWeek:
            label.text = StringConstants.lastWeekLabelText
        }
        return label
    }
}
