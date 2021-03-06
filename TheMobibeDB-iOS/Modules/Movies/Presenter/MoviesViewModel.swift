//
//  MoviesViewModel.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Combine
import Foundation

class MoviesViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var domain: [Movies.Movie.Domain]?
    @Published var error: String?
    @Published var isSavedMovie = false
    
    // Internal Properties
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getMoviesUseCase: GetMoviesUseCase
    private var saveSongUseCase: SaveSongUseCase
    
    // MARK: - Initializers
    
    init(getMoviesUseCase: GetMoviesUseCase,
         saveSongUseCase: SaveSongUseCase
    ) {
        self.getMoviesUseCase = getMoviesUseCase
        self.saveSongUseCase = saveSongUseCase
    }
    
    // MARK: - Internal Methods
    
    func getMovies() {
        guard ApiTool.isConnected else {
            DispatchQueue.main.async {
                self.error = "No tienes conexión a internet"
            }
           
            return
        }
        
        progressTitle = "Cargando..."
        showProgress = true
        
        getMoviesUseCase.invoke(request: .init(page: 1))?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    self?.error = error.localizedDescription
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [Movies.Movie.Domain]?) in
                self?.domain = value
            })
            .store(in: &subscriptions)
    }
    
    func saveMovie(_ movie: Movies.Movie.Domain, url: URL?) {
        isSavedMovie = saveSongUseCase.invoke(request: movie, url: url)
    }

}
