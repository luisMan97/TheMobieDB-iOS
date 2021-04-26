//
//  LocalFavoriteMoviesDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

protocol LocalFavoriteMoviesDataSource {
        
    func getMovies() -> [Movies.Movie.Domain]
    
}
