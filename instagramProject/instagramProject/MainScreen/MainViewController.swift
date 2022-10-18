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
        feedTableView.dataSource = self
        feedTableView.register(UINib(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoryCell")
        feedTableView.rowHeight = UITableView.automaticDimension
        feedTableView.estimatedRowHeight = 44
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "StoryCell",
            for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
        // guard let cell = // tableView.dequeueReusableCell(withIdentifier: // "TableViewCell") as? TableViewCell
        // else {print("sdfsdfsdfsdfsdf")
        //    return UITableViewCell() }
        // print("\(cell)")
        // cell.frame.size.height = cell.contentView.frame.height
        return cell
    }
}
