//
//  FavoriteMoviesRepository.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class FavoriteMoviesRepository: ObservableObject {
    
    private var dataSource: LocalFavoriteMoviesDataSource
    
    init(dataSource: LocalFavoriteMoviesDataSource) {
        self.dataSource = dataSource
    }
    
    func getMovies() -> [Movies.Movie.Domain] {
        dataSource.getMovies()
    }
    
}
