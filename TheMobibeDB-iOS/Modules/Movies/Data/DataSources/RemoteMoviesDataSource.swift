//
//  RemoteMoviesDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine

protocol RemoteMoviesDataSource {
        
    func getMovies(request: Movies.Movie.Request) -> AnyPublisher<[Movies.Movie.Domain]?, Error>
    
}
