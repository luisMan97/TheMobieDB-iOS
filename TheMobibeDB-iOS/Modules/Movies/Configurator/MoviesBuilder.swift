//
//  MoviesBuilder.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

class MoviesBuilder {
    
    class func createModule() -> MoviesView {
        let apiManager = APIManager()
        
        let dataSource = MoviesURLSessionDataSource(apiManager: apiManager)
        
        let repository: MoviesRepository = MoviesRepository(dataSource: dataSource)
        
        // Interactor
        let getMoviesUseCase = GetMoviesUseCase(repository: repository)
        
        // ViewModel
        let viewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase)
        
        return MoviesView(viewModel: viewModel)
    }
    
}
