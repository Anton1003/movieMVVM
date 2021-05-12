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

    var viewModel: MoviesViewModel!

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
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "movieCell",
            for: indexPath
        ) as? MovieTableViewCell
        else { return UITableViewCell() }
        cell.prepareCell(movie: movies[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        coordinator?.showDetail()
    }
}

extension MoviesTableViewController {
    static func instantiate() -> MoviesTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard
            .instantiateViewController(withIdentifier: "MoviesTableViewController") as? MoviesTableViewController
        return controller ?? MoviesTableViewController()
    }
}
