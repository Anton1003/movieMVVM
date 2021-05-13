//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import UIKit
///
final class DetailViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var categoriesLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var summaryTextView: UITextView!

    var movie: Movies!

    var viewModel: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)") else { return }
//        DispatchQueue.global().async { [weak self] in
//            if let dataImage = try? Data(contentsOf: imageURL) {
//                DispatchQueue.main.async {
//                    self?.bigPosterImageView.image = UIImage(data: dataImage)
//                }
//            }
//        }
//        titleLabel.text = movie.title
//        ratingLabel.text = "\(movie.popularity)"
//        summaryTextView.text = movie.overview
//        categoriesLabel.text = "\(movie.voteAverage)"
//        durationLabel.text = movie.releaseDate
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ImageCollectionCell
        else { return UICollectionViewCell() }
//        if let photo = presenter?.imageArray[indexPath.row] {
//            cell.setImage(photo)
//        }
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {}
