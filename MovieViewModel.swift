//
//  MovieViewModel.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import Foundation

class MovieViewModel : ObservableObject {
    @Published var movies: [Movie] = []
    private let key = "ff913f8e821db8e3d75117e48d6bb5e0"
   
    
    
    func fetchPopularMovies() async {
        let endPoint = "https://api.themoviedb.org/3/movie/popular?api_key=\(key)"
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            
            let movieResponse = try decoder.decode(MovieResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.movies = movieResponse.results
            }
        } catch {
            
        }
    }
    
    //
    
    func fetchUpcomingMovies() async {
        let endPoint = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(key)"
        
        guard let url = URL(string: endPoint) else {
            print("bad URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            
            let movieResponse = try decoder.decode(MovieResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.movies = movieResponse.results
            }
        } catch {
            print("Error decoding")
        }
    }
}
