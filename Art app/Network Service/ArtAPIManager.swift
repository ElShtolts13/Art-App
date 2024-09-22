//
//  ArtAPIManager.swift

//
//  Created by Надежда Капацина on 21.09.2024.
//

import Foundation

final class ArtAPIManager {
    
    static let shared = ArtAPIManager()
    
    func fetchData(oneComplection: @escaping([Artist]) -> ()) {
        
        let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, resp, error) in
            
            guard  let data = data else {
                print("data was nil")
                return
            }
            
            guard let  artistList = try? JSONDecoder().decode(ArtistList.self, from: data) else {
                print("couldn't decode json")
                return
            }
            oneComplection(artistList.artists)
        }
        task.resume()
    }
}
