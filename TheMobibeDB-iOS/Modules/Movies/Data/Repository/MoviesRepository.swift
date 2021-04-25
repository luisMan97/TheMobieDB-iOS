//
//  MoviesRepository.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine

class MoviesRepository: ObservableObject {
    
    private var dataSource: RemoteMoviesDataSource
    
    init(dataSource: RemoteMoviesDataSource) {
        self.dataSource = dataSource
    }
    
    func getMovies(request: Movies.Movie.Request) -> AnyPublisher<[Movies.Movie.Domain]?, Error>? {
        dataSource.getMovies(request: request)
            .eraseToAnyPublisher()
    }
    
}
