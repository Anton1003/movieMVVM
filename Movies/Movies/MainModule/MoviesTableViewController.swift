//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import UIKit
///
final class MoviesTableViewController: UITableViewController {
    private var movies: [Result] = []

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        Loader().loadWMovies { moviesArray in
            self.movies = moviesArray.results
            self.tableView.reloadData()
        }
    }

//    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
//        if let vcMVD = segue.destination as? DetailViewController {
//            guard let row = tableView.indexPathForSelectedRow?.row else { return }
//            let movie = movies[row]
//            vcMVD.movie = movie
//        }
//    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

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
        coordinator?.showDetail()
    }
}
