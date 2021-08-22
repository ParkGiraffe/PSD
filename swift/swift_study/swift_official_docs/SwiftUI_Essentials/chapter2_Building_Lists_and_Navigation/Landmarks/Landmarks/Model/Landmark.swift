//
//  Landmark.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/18.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    // Adding Codable conformance makes it easier to load data into the structure from the data file, which you’ll do later in this section.
    
    // Identifiable protocool require 'id'
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // make the property private because users of the Landmarks structrue care only about the image itself
    private var imageName: String // read the name of the image from the data
    var image: Image {
        Image(imageName) // loads an image from the asset catalog.
    }
    
    // private - you'll use it only to create a public computed property
    private var coordinates: Coordinates
    // Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude
        )
    }

    struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
    }
}
