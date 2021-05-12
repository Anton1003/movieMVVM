//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import CoreData
import UIKit
///
final class MoviesTableViewController: UITableViewController {
    private var movies: [Movies] = []

    weak var coordinator: MainCoordinator?
    private var coreDataManager = CoreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService().loadMovies { moviesArray in
            self.movies = moviesArray.results
            self.tableView.reloadData()
        }

//        coreDataManager.saveMovies(
//            id: 1,
//            title: "Test",
//            popularity: 0.1,
//            posterPath: "some path",
//            releaseDate: "01.01.01",
//            voteAverage: 0.2
//        )
//        print(coreDataManager.fetchMovies())
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
