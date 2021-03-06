//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/22.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    // @ attribute를 통해 상위 뷰에서 enviromentObject를 전달해주는 것을 받는다.
    
    @State private var showFavoritesOnly = false
    // create state as private, because state property hold information that's specific to a view and its subviews.
    // false로 지정하면 초기 실행시 기본 값이 false, true면 기본 값이 true로 된다..
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) { // You use the $ prefix to access a binding to a state variable, or one of its properties.
                    Text("Favorite Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    // list에 대한 추가 조사 필요
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)) {
                        LandmarksRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}

//ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
//ForEach는 컬렉션에서 리스트와 동일한 방식으로 작동하므로 스택, 목록, 그룹 등 하위 보기를 사용할 수 있는 모든 위치에서 사용할 수 있습니다. 데이터의 요소가 여기서 사용하는 문자열과 같은 단순한 값 유형인 경우 \.self를 식별자의 키 경로로 사용할 수 있습니다.
