//
//  MoviesViewModel.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import UIKit

final class MoviesCellViewModel {
    private(set) var titleLabel: String
    private(set) var summaryLabel: String
    private(set) var ratingLabel: Double
    private(set) var categoriesLabel: Double
    private(set) var posterPath: String

    private var cacheDictionary: [String: Data] = [:]

    init(titleLabel: String, summaryLabel: String, ratingLabel: Double, categoriesLabel: Double, posterPath: String) {
        self.titleLabel = titleLabel
        self.summaryLabel = summaryLabel
        self.ratingLabel = ratingLabel
        self.categoriesLabel = categoriesLabel
        self.posterPath = posterPath
    }
}
