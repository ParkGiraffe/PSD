//
//  LandmarksRow.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/19.
//

import SwiftUI

struct LandmarksRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
        }
    }
}

struct LandmarksRow_Previews: PreviewProvider {
    static var previews: some View {
        Group { // Group is a container for grouping view content. Xcode renders the group’s child views as separate previews in the canvas.
            LandmarksRow(landmark: landmarks[0])
            LandmarksRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
