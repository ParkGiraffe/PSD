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
        LandmarksRow(landmark: landmarks[0])
    }
}
