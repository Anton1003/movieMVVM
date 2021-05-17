//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by User on 11.03.2021.
//

import UIKit

final class MovieTableCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var categoriesLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!

    private var cacheDictionary: [String: Data] = [:]

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(with viewModel: Movies) {
        titleLabel.text = viewModel.title
        summaryLabel.text = viewModel.releaseDate
        ratingLabel.text = "\(viewModel.popularity)"
        categoriesLabel.text = "\(viewModel.voteAverage)"
        posterImageView.image = nil
        if cacheDictionary[viewModel.posterPath] != nil {
            posterImageView.image = UIImage(data: cacheDictionary[viewModel.posterPath] ?? Data())
        } else {
            guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.posterPath)") else { return }

            DispatchQueue.global().async { [weak self] in
                if let dataImage = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        self?.cacheDictionary[viewModel.posterPath] = dataImage
                        self?.posterImageView.image = UIImage(data: dataImage)
                    }
                }
            }
        }
    }
}
