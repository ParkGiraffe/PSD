//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarksRow(landmark: landmarks[0])
            LandmarksRow(landmark: landmarks[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
