//
//  CoreDataManager.swift
//  Movies
//
//  Created by User on 12.05.2021.
//

import CoreData

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "MoviesModel")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()

    var managerObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func saveMovies(
        id: Int,
        title: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        voteAverage: Double
    ) {
        let movies = MoviesCoreData(context: managerObjectContext)
        movies.setValue(id, forKey: "id")
        movies.setValue(title, forKey: "title")
        movies.setValue(popularity, forKey: "popularity")
        movies.setValue(posterPath, forKey: "posterPath")
        movies.setValue(releaseDate, forKey: "releaseDate")
        movies.setValue(voteAverage, forKey: "voteAverage")
        do {
            try managerObjectContext.save()
        } catch {
            print(error)
        }
    }

    func fetchMovies() -> [MoviesCoreData] {
        do {
            let fetchRequest = NSFetchRequest<MoviesCoreData>(entityName: "MoviesCoreData")
            let movies = try managerObjectContext.fetch(fetchRequest)
            return movies
        } catch {
            print(error)
            return []
        }
    }
}
