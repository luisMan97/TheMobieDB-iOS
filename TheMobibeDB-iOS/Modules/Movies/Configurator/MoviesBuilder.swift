//
//  MoviesBuilder.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation
import CoreData

class MoviesBuilder {
    
    class func createModule(managedContext: NSManagedObjectContext) -> MoviesView {
        let apiManager = APIManager()
        
        let dao = MoviesDao(managedContext: managedContext)
        
        let remoteDataSource = MoviesURLSessionDataSource(apiManager: apiManager)
        let localDataSource = MoviesCoreDataDataSource(dao: dao, managedContext: managedContext)
        
        let repository: MoviesRepository = MoviesRepository(remoteDataSource: remoteDataSource, localDataSource: localDataSource)
        
        // Interactor
        let getMoviesUseCase = GetMoviesUseCase(repository: repository)
        let saveSongUseCase = SaveSongUseCase(repository: repository)
        
        // ViewModel
        let viewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase, saveSongUseCase: saveSongUseCase)
        
        return MoviesView(viewModel: viewModel)
    }
    
}
