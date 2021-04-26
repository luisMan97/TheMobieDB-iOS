//
//  LocalMoviesDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

protocol LocalMoviesDataSource {
    
    func saveMovie(request: Movies.Movie.Domain) -> Bool
    
}
