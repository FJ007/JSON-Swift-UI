//
//  Movies.swift
//  JSONSwiftUI
//
//  Created by Javier Fernández on 02/07/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation

struct Movie: Codable, Identifiable {
    var id: Int
    var name: String
    var released: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case released = "year"
    }
}

public class Movies: ObservableObject {
    
    @Published var store = [Movie]()
    
    init() {
      downloadJSON()
    }
    
    func downloadJSON() {
        guard let url = URL(string: "https://gist.githubusercontent.com/rbreve/60eb5f6fe49d5f019d0c39d71cb8388d/raw/f6bc27e3e637257e2f75c278520709dd20b1e089/movies.json") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let dataJSON = data {
                    let movies = try JSONDecoder().decode([Movie].self, from: dataJSON)
                    DispatchQueue.main.async {
                        self.store = movies
                    }
                } else {
                    print("Data Error URL")
                }
            } catch {
                print (error)
            }
        }.resume()
    }
}
