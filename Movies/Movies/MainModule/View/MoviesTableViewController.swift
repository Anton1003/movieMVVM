//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import UIKit
///
final class MoviesTableViewController: UITableViewController {
    private var movies: [Movies] = []

    var viewModel: MoviesTableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService().loadMovies { moviesArray in
            self.movies = moviesArray.results
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        movies.count
//        viewModel.numberOfRous()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "movieCell",
            for: indexPath
        ) as? MovieTableViewCell
        else { return UITableViewCell() }
        cell.prepareCell(movie: movies[indexPath.row])
        return cell
//        let cellViewModel = viewModel.cell(for: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetail()
    }
}
