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
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(domain.posterPath)")!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                .frame(width: 100, height: 180)
            
            Text(domain.title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
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
