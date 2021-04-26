//
//  MovieFavoriteItem.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct MovieFavoriteItem: View {
    
    var domain: Movies.Movie.Domain
    var onTap: (_ item: Movies.Movie.Domain) -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                UIImage(data: domain.image).map { uiImage in
                    ZStack {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.width - 100)
                    }
                }
                    
                PencentageView(percentage: CGFloat(domain.voteAverage))
                    .padding(.leading, 4)
                    .padding(.bottom, -17.5)
            }
                
            Text(domain.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.top)
                .frame(height: 60)
            
            Text(domain.releaseDate)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }.padding(.top)
        .onTapGesture {
            onTap(domain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(white: 0.95))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}

