//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import UIKit

final class MoviesTableViewController: UITableViewController {
    var viewModel: MoviesTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewLoader()
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel.numberOfRous()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellViewModel = viewModel.cell(for: indexPath)
//        switch cellViewModel {
//        case let .moviesCell(moviesCellViewModel):
        guard let movie = viewModel?.movies?[indexPath.row],
              let cell = tableView.dequeueReusableCell(
                  withIdentifier: "movieCell",
                  for: indexPath
              ) as? MovieTableCell
        else { return UITableViewCell() }
        cell.update(with: movie)
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetail(for: indexPath)
    }
}
