//
//  FavoriteMoviesView.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___ All rights reserved.
//

import SwiftUI

struct FavoriteMoviesView: View {
    
    @ObservedObject var viewModel: FavoriteMoviesViewModel

    @State private var movie: Movies.Movie.Domain?
    
    private let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if viewModel.domain != nil && viewModel.domain?.count ?? 0 > 0 {
                viewModel.domain.map { domain in
                    VStack {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: rows, spacing: 20) {
                                ForEach(domain) { item in
                                    MovieFavoriteItem(domain: item, onTap: { movie in
                                        self.movie = item
                                    })
                                }
                            }.padding(.horizontal, 20)
                        }
                    }
                }
                    
            } else {
                Spacer()
                
                Text("Aún no tienes peliculas favoritas")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
            }
        }.navigationBarTitle("Peliculas favoritas")
        .sheet(item: $movie) {
            FavoriteMovieDetail(domain: $0, isMovieSaved: .constant(false))
        }.onAppear {
            viewModel.getCourses()
        }
    }
    
}

struct FavoriteMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        return FavoriteMoviesBuilder.createModule(managedContext: appDelegate.databaseManager.managedContext)
    }
}
