//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            // list에 대한 추가 조사 필요
            LandmarksRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
