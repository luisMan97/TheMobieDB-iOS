//
//  MoviesView.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    @State private var movie: Movies.Movie.Domain?
    
    private let columns = [
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20),
    ]
        
    var body: some View {
        LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
            NavigationView {
                VStack {
                    viewModel.domain.map { domain in
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(domain) { movie in
                                    MovieItem(domain: movie, onTap: { movie in
                                        self.movie = movie
                                    })
                                }
                            }
                            .padding(.all, 50)
                        }
                    }
                }.navigationBarTitle("Peliculas")
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
                .sheet(item: $movie, content: MovieDetail.init)
            }
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesBuilder.createModule()
    }
}
