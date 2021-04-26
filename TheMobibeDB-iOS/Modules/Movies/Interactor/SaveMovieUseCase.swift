//
//  SaveMovieUseCase.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

class SaveSongUseCase {
    
    // Repository
    private var repository: MoviesRepository
    
    // MARK: - Initializers
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: Movies.Movie.Domain, url: URL?) -> Bool {
        var movie = request
        movie.image = urlToString(url: url)!
        return repository.saveMovies(request: movie)
    }
    
    private func urlToString(url: URL?) -> Data? {
        guard let url = url else {
            return nil
        }
        guard let imageData = try? Data(contentsOf: url) else {
            return nil
        }
        
        return imageData
    }
    
}
