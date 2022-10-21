//
//  ViewController.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 17.10.2022.
//

import UIKit

/// Главный экран
final class MainViewController: UIViewController {

    // MARK: internal types

    private enum TableCellTypes {
        case storysCell
        case postCell
        case recomendCell
    }

    private enum CellIdentifaers: String {
        case storysCell = "cell"
        case postCell = "postCell"
        case recomendCell = "recomendCell"
    }

    // MARK: - private properties

    private let cellsTypes: [TableCellTypes] = [.storysCell, .postCell, .recomendCell]

    // MARK: - private visual components

    @IBOutlet private weak var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// методы UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let types = cellsTypes[indexPath.row]
        switch types {
        case .storysCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifaers.storysCell.rawValue)
            else { return UITableViewCell() }
            return cell
        case .postCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifaers.postCell.rawValue)
            else { return UITableViewCell() }
            return cell
        case .recomendCell:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifaers.recomendCell.rawValue)
            else { return UITableViewCell() }
            return cell
        }
    }
}
