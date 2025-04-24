//
//  MovieResponse.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import Foundation

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
}

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
}
