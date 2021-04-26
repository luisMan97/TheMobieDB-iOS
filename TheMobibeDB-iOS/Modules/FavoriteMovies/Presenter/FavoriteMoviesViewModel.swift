//
//  FavoriteMoviesViewModel.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

class FavoriteMoviesViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var domain: [Movies.Movie.Domain]?
    
    // Interactor
    private var getFavoriteMoviesUseCase: GetFavoriteMoviesUseCase
    
    // MARK: - Initializers
    
    init(getFavoriteMoviesUseCase: GetFavoriteMoviesUseCase) {
        self.getFavoriteMoviesUseCase = getFavoriteMoviesUseCase
    }
    
    // MARK: - Internal Methods
    
    func getCourses() {
        domain = getFavoriteMoviesUseCase.invoke()
    }

}
