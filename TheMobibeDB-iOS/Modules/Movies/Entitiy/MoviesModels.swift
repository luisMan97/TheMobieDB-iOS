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
            
            private enum CodingKeys: String, CodingKey {
                case id = "id"
                case title = "original_title"
                case overview = "overview"
                case posterPath = "poster_path"
            }
        }
        
        struct Domain: Identifiable {
            let id: Int
            let title: String
            let overview: String
            let posterPath: String
        }
        
    }
    
}

extension Movies.Movie.Response {
    
    func toDomain() -> Movies.Movie.Domain {
        .init(id: id ?? 0,
              title: title ?? "",
              overview: overview ?? "",
              posterPath: posterPath ?? ""
        )
    }
    
}
