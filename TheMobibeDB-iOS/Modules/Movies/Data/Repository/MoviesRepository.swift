//
//  MoviesRepository.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine

class MoviesRepository: ObservableObject {
    
    private var remoteDataSource: RemoteMoviesDataSource
    private var localDataSource: LocalMoviesDataSource
    
    init(remoteDataSource: RemoteMoviesDataSource, localDataSource: LocalMoviesDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getMovies(request: Movies.Movie.Request) -> AnyPublisher<[Movies.Movie.Domain]?, Error>? {
        remoteDataSource.getMovies(request: request)
            .eraseToAnyPublisher()
    }
    
    func saveMovies(request: Movies.Movie.Domain) -> Bool {
        localDataSource.saveMovie(request: request)
    }
    
}
