//
//  MoviesModels.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

enum Movies {
    
    enum Movie {
        
        struct Request {
            let page: Int
        }
        
        struct Response: Codable {
            let id: Int?
            let title: String?
            let overview: String?
            let posterPath: String?
            let voteAverage: Float?
            let popularity: Float?
            let releaseDate: String?
            
            private enum CodingKeys: String, CodingKey {
                case id
                case title = "original_title"
                case overview = "overview"
                case posterPath = "poster_path"
                case voteAverage = "vote_average"
                case popularity
                case releaseDate = "release_date"
            }
        }
        
        struct Domain: Identifiable {
            let id: UUID
            let title: String
            let overview: String
            let posterPath: String
            let voteAverage: Float
            let popularity: Float
            let releaseDate: String
            var image: Data
        }
        
    }
    
}

extension Movies.Movie.Response {
    
    func toDomain() -> Movies.Movie.Domain {
        .init(id: /*id ?? 0*/ UUID(),
              title: title ?? "",
              overview: overview ?? "",
              posterPath: posterPath ?? "",
              voteAverage: voteAverage ?? 0.0,
              popularity: popularity ?? 0.0,
              releaseDate: releaseDate ?? "",
              image: Data()
        )
    }
    
}

extension Movies.Movie.Domain {
    
    func toCoreDataMovie(_ movie: Movie) {
        //movie.id = Int16(id)
        movie.overview = overview
        movie.popularity = popularity
        movie.posterPath = posterPath
        movie.releaseDate = releaseDate
        movie.title = title
        movie.image = image
        movie.voteAverage = voteAverage
    }
    
}
