//
//  CircleImage.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/15.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle()) // 원으로 짜름.
            // The Circle type is a shape that you can use as a mask, or as a view by giving the circle a stroke or fill.
            .overlay(Circle().stroke(Color.white, lineWidth: 4)) // stroke: 획
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
