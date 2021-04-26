//
//  FavoriteMovieDetail.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct FavoriteMovieDetail: View {
    
    var domain: Movies.Movie.Domain
    var onTapSaveButton: ((Movies.Movie.Domain, URL?) -> Void)?
    
    @Binding var isMovieSaved: Bool
    
    var body: some View {
        VStack {
            VStack {
                HandleBar()
                    .padding(.vertical, 10)
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.handlebarBackgroundGrayColor))
            
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    ScrollView {
                        Text(domain.title)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                            .padding(.top)
                        
                        UIImage(data: domain.image).map { uiImage in
                            ZStack {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                        Text(domain.overview)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                    }
                }
                
                if onTapSaveButton != nil {
                    Button(action: {
                        onTapSaveButton?(domain, URL(string: "https://image.tmdb.org/t/p/w500\(domain.posterPath)"))
                    }, label: {
                        Image(systemName: "star.circle.fill")
                            .foregroundColor(.white)
                            .frame(width: 52, height: 52)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .padding(.trailing)
                    })
                }
            }.alert(isPresented: $isMovieSaved) {
                .init(title: Text(""), message: Text("La pelicula ha sido guardada en favoritos"), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
}
