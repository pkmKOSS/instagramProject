//
//  ViewController.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 17.10.2022.
//

import UIKit

/// Главный экран
final class MainViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!

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
        switch indexPath.row {
        case 0:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Strings.)
            else { return UITableViewCell() }
            return cell
        case 1:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Strings.postCellID)
            else { return UITableViewCell() }
            return cell
        case 2:
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: Strings.recomendCellID)
            else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
