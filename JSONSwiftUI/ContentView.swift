//
//  ContentView.swift
//  JSONSwiftUI
//
//  Created by Javier Fernández on 02/07/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var movies = Movies()
    
    var body: some View {
        NavigationView {
            List(movies.store) { movie in
                VStack (alignment: .leading) {
                    Text(movie.name)
                        .font(.body)
                        .bold()
                    Text(movie.released)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(8)
            }
            .navigationBarTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
