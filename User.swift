//
//  User.swift
//  MovieTipsApp
//
//  Created by Robin jakobsson on 2025-04-23.
//

import Foundation
import FirebaseFirestore

struct User : Identifiable, Codable  {
    
    @DocumentID
    var id: String?
    
    var name: String
    var tips : String
    
}
