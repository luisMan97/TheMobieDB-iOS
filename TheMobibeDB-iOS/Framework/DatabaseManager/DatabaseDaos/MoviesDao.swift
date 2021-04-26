//
//  LyricsSearchDao.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation
import CoreData

class MoviesDao {
    
    @Published var isSaved = false
    
    private var managedContext: NSManagedObjectContext
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    // Create
    
    func saveMovie() -> Bool {
        saveContext()
    }
    
    // Read
    
    func getMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            let coreDataMovies = try managedContext.fetch(fetchRequest)
            
            return coreDataMovies
        } catch {
            print("Algo ocurrio: \(error.localizedDescription)")
        }
        
        return []
    }
    
}

private extension MoviesDao {
    
    func saveContext() -> Bool {
        do {
            try managedContext.save()
        } catch {
            print("Error saving managed object context: \(error.localizedDescription)")
            return false
        }
        
        return true
    }
    
}
