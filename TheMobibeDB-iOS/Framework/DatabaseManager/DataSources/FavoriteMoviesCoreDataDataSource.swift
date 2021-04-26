//
//  FavoriteMoviesCoreDataDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Foundation
import CoreData

class FavoriteMoviesCoreDataDataSource: LocalFavoriteMoviesDataSource {
    
    var dao: MoviesDao
    
    init(dao: MoviesDao) {
        self.dao = dao
    }
    
    func getMovies() -> [Movies.Movie.Domain] {
        let coreDataMovies = dao.getMovies()
        var movies = coreDataMovies.compactMap { movie in
            movie.toDomain()
        }
        movies.reverse()
        return movies
    }
    
}
