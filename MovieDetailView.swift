//
//  MovieDetailView.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let movie = movie {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxHeight: .infinity)
                            .clipped()
                            .cornerRadius(12)
                            .ignoresSafeArea()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Button(action: {
                        // code
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.white)
                            .shadow(radius: 10)
                            .padding()
                    }
                }
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                
                Text(movie.overview)
                    .font(.body)
                
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 123, title: "123", overview: "hellowrold", poster_path: "123"))
}
