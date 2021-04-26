//
//  MoviesView.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    @ObservedObject var searchBar: SearchBar = SearchBar()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var movie: Movies.Movie.Domain?
    @State private var isShowingFavoriteMoviesList = false
    
    private let columns = [
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20),
    ]
    
    private func filterList(_ movie: [Movies.Movie.Domain]) -> [Movies.Movie.Domain] {
        movie.filter({ searchBar.text.isEmpty || $0.title.localizedStandardContains(searchBar.text) })
    }
        
    var body: some View {
        LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
            NavigationView {
                VStack {
                    if viewModel.domain != nil {
                        viewModel.domain.map { domain in
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(filterList(domain)) { movie in
                                        MovieItem(domain: movie, onTap: { movie in
                                            self.movie = movie
                                        })
                                    }.add(searchBar)
                                }
                                .padding(.all, 50)
                            }
                        }
                    } else {
                        Spacer()
                        
                        Text("No hay resultados para mostrar.")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    
                    NavigationLink(destination: FavoriteMoviesBuilder.createModule(managedContext: viewContext), isActive: $isShowingFavoriteMoviesList) { EmptyView() }
                }.navigationBarTitle("Peliculas")
                .sheet(item: $movie) {
                    MovieDetail(domain: $0, onTapSaveButton: viewModel.saveMovie, isMovieSaved: $viewModel.isSavedMovie)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("tmdb")
                            .resizable()
                            .frame(width: 136.5, height: 18)
                    }
                }
                .navigationBarItems(trailing:
                    Button(action: {
                        isShowingFavoriteMoviesList = true
                    }, label: {
                        Image(systemName: "star.circle")
                            .font(.title2)
                    })
                )
                .onAppear {
                    viewModel.getMovies()
                }
                .alert(item: $viewModel.error) {
                    Alert(title: Text("Error"),
                          message: Text($0),
                          primaryButton: .default(Text("Ok")),
                          secondaryButton: .default(Text("Reintentar"), action: viewModel.getMovies)
                    )
                }
            }
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        return  MoviesBuilder.createModule(managedContext: appDelegate.databaseManager.managedContext)
    }
}
