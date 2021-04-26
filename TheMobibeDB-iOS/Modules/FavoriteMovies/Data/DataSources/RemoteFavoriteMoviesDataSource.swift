//
//  RemoteFavoriteMoviesDataSource.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import Combine

protocol RemoteFavoriteMoviesDataSource {
        
    func doSomething() -> AnyPublisher<FavoriteMovies.Something.Domain?, Error>
    
}
