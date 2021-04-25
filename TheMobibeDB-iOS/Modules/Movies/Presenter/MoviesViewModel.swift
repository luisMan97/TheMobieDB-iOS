//
//  MoviesViewModel.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine

class MoviesViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var domain: [Movies.Movie.Domain]?
    
    // Internal Properties
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getMoviesUseCase: GetMoviesUseCase
    
    // MARK: - Initializers
    
    init(getMoviesUseCase: GetMoviesUseCase) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    // MARK: - Internal Methods
    
    func getMovies() {
        progressTitle = "Cargando..."
        showProgress = true
        
        getMoviesUseCase.invoke(request: .init(page: 1))?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    print(error.localizedDescription)
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [Movies.Movie.Domain]?) in
                self?.domain = value
            })
            .store(in: &subscriptions)
    }

}
