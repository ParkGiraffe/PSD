//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300) // 따로 높이 지정을 안 하면 최대한 가능한 한 많은 면적을 차지하려고 함.
                .ignoresSafeArea(edges: .top) // 위의 노치 바 까지 적용하게 해줌.
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) { //vertical
                
                // describe the view's content and layout.
                // To customize a SwiftUI view, you call methods called modifiers.
                // .font, .padding,.foregroundColor 같은 것들을 Modifier라고 한다.
                // 오른쪽에 뜨는 Xcode modifier을 통해서 수정할 수도 있다.
                // Text를 cmd + 클릭해서, 'Show SwiftUI Inspector을 선택해도 된다.
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack { // horizontal
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer() // A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                // Stack 단위로 그 안에 포함된 Text의 폰트 등 스타일을 일괄로 적용이 가능한 것으로 보인다.
                // When you apply a modifier to a layout view like a stack, SwiftUI applies the modifier to all the elements contained in the group.
                
                Divider() // 구분을 위한 띄기 + 구분선
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
