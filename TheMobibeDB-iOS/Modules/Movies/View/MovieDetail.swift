//
//  MovieDetail.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import SwiftUI

struct MovieDetail: View {
    
    var domain: Movies.Movie.Domain
    
    var body: some View {
        VStack {
            VStack {
                HandleBar()
                    .padding(.vertical, 10)
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.handlebarBackgroundGrayColor))
            
            VStack {
                Text(domain.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .padding(.top)
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(domain.posterPath)")!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() })
                    .frame(maxWidth: .infinity)
                    .padding()
                
                Text(domain.overview)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
            }
        }
    }
    
}
