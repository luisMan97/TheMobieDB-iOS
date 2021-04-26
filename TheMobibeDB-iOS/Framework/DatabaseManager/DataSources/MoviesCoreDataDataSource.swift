//
//  MoviesCoreDataDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation
import CoreData

class MoviesCoreDataDataSource: LocalMoviesDataSource {
        
    var dao: MoviesDao
    private var managedContext: NSManagedObjectContext
    
    init(dao: MoviesDao, managedContext: NSManagedObjectContext) {
        self.dao = dao
        self.managedContext = managedContext
    }
    
    func saveMovie(request: Movies.Movie.Domain) -> Bool {
        let movie = Movie(context: managedContext)
        request.toCoreDataMovie(movie)
        return dao.saveMovie()
    }
    
}
