//
//  Movie+CoreDataProperties.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id: Int16
    @NSManaged public var image: Data?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Float
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var voteAverage: Float
    
    func toDomain() -> Movies.Movie.Domain {
        .init(id: UUID(),
              title: title ?? "",
              overview: overview ?? "",
              posterPath: posterPath ?? "",
              voteAverage: voteAverage,
              popularity: popularity,
              releaseDate: releaseDate ?? "",
              image: image ?? Data()
        )
    }

}

extension Movie : Identifiable {

}
