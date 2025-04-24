//
//  ContentView.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MovieViewModel()
    @StateObject private var userVm = UserViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(vm.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieCardView(movie: movie)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
                .navigationTitle("Popular Movies")
                
            }
            .task {
                await vm.fetchPopularMovies()
            }
        }
    }
}
#Preview {
    ContentView()
}
