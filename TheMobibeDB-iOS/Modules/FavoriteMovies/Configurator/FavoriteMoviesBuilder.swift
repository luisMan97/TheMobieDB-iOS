//
//  FavoriteMoviesBuilder.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Foundation
import CoreData

class FavoriteMoviesBuilder {
    
    class func createModule(managedContext: NSManagedObjectContext) -> FavoriteMoviesView {
        // Dao
        let dao = MoviesDao(managedContext: managedContext)
        
        // DataSource
        let dataSource = FavoriteMoviesCoreDataDataSource(dao: dao)
        
        let repository: FavoriteMoviesRepository = FavoriteMoviesRepository(dataSource: dataSource)
        
        // Interactor
        let getFavoriteMoviesUseCase = GetFavoriteMoviesUseCase(repository: repository)
        
        // ViewModel
        let viewModel = FavoriteMoviesViewModel(getFavoriteMoviesUseCase: getFavoriteMoviesUseCase)
        
        return FavoriteMoviesView(viewModel: viewModel)
    }
    
}
