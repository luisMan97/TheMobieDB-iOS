//
//  GetFavoriteMoviesUseCase.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class GetFavoriteMoviesUseCase: ObservableObject {
    
    // Repository
    private var repository: FavoriteMoviesRepository
    
    // MARK: - Initializers
    
    init(repository: FavoriteMoviesRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke() -> [Movies.Movie.Domain] {
        let movies = repository.getMovies()
        let filteredMovies = movies.filterDuplicates { $0.title == $1.title }
        return filteredMovies
    }

}
