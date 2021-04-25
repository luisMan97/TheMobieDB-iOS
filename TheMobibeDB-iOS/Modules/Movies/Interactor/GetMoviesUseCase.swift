//
//  GetMoviesUseCase.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine

class GetMoviesUseCase: ObservableObject {
    
    // Repository
    private var repository: MoviesRepository
    
    // MARK: - Initializers
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: Movies.Movie.Request) -> AnyPublisher<[Movies.Movie.Domain]?, Error>? {
        repository.getMovies(request: request)
    }

}
