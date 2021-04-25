//
//  MovieResponseServer.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

struct MovieResponseServer: Codable {
    
    let results: [Movies.Movie.Response]?
    
}

extension MovieResponseServer {
    
    func toMovieDomainList() -> [Movies.Movie.Domain]? {
        results?.map {
            $0.toDomain()
        }
    }
    
}
