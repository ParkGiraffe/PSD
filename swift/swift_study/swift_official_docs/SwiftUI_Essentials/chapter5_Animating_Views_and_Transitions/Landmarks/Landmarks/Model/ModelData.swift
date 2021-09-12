//
//  ModelData.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/18.
//

import Foundation
import Combine

final class ModelData: ObservableObject { // SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
    
    // create an array initialized with landmarks from a file.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    
    var hikes: [Hike] = load("hikeData.json")
}



// Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.
// The load method relies on the return type’s conformance to the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
