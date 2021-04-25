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
    
    @State private var movie: Movies.Movie.Domain?
    
    private let columns = [
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20),
    ]
    
    let rows = [
            GridItem(.fixed(50))
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
                            VStack {
                                /*ScrollView(.horizontal) {
                                    LazyHGrid(rows: rows, spacing: 20) {
                                        ForEach(domain) { item in
                                            MovieItem(domain: item, onTap: { movie in
                                                self.movie = item
                                            })
                                        }
                                    }.padding(.horizontal, 20)
                                }*/
                                
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
                        }
                    } else {
                        Spacer()
                        
                        Text("No hay resultados para mostrar.")
                        
                        Spacer()
                    }
                }.navigationBarTitle("Peliculas")
                .sheet(item: $movie, content: MovieDetail.init)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("tmdb")
                            .resizable()
                            .frame(width: 136.5, height: 18)
                    }
                }
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
        MoviesBuilder.createModule()
    }
}
