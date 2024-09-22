//
//  ArtData.swift

//
//  Created by Надежда Капацина on 21.09.2024.
//

import Foundation

// MARK: - ArtistList
struct ArtistList: Codable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Codable {
    let name, bio, image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Codable {
    let title, image, info: String
}
