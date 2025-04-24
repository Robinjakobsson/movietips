//
//  ListView.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie?

    var body: some View {
        
        if let movie = movie {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 180)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                }
                
                Text(movie.title)
                    .font(.caption)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .frame(width: 120, alignment: .leading)
            }
            .frame(width: 120)
            .padding(.vertical)
        }
        else {
            Text("Movies loading..")
            ProgressView()
        }
    }
}

#Preview {
    MovieCardView(movie: Movie(id: 123, title: "titanic", overview: "båtar som åker på vattnet", poster_path: "123"))
}
