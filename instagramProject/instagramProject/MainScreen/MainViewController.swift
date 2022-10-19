//
//  ViewController.swift
//  instagramProject
//
//  Created by Григоренко Александр Игоревич on 17.10.2022.
//

import UIKit

/// Главный экран
final class MainViewController: UIViewController {

    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else { return UITableViewCell() }
        return cell
    }
}
