//
//  MovieItem.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct MovieItem: View {
    
    var domain: Movies.Movie.Domain
    var onTap: (_ item: Movies.Movie.Domain) -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(domain.posterPath)")!,
                                placeholder: { Text("Loading ...") },
                                image: { Image(uiImage: $0).resizable() })
                    .frame(maxWidth: UIScreen.main.bounds.width - 100)
                    
                    PencentageView(percentage: CGFloat(domain.voteAverage))
                        .padding(.leading, 4)
                        .padding(.bottom, -17.5)
            }
                
            Text(domain.title)
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.top)
                .frame(height: 60)
            
            Text(domain.releaseDate)
                .font(.caption)
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
