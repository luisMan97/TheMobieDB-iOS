//
//  MoviesURLSessionDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation
import Combine

class MoviesURLSessionDataSource: RemoteMoviesDataSource {
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getMovies(request: Movies.Movie.Request) -> AnyPublisher<[Movies.Movie.Domain]?, Error> {
        return getMoviesPublisher(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
}

private extension MoviesURLSessionDataSource {
    
    func getMoviesPublisher(request: Movies.Movie.Request) -> AnyPublisher<MovieResponseServer, Error> {
        let parameters = [
            "page": request.page
        ] as [String: Any]
        
        return APIManager.request(service: .Movies(parameters))
    }
    
    private func mapResponseToDomain(_ serverResponse: MovieResponseServer) -> [Movies.Movie.Domain]? {
        serverResponse.toMovieDomainList()
    }
    
}
