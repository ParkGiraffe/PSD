//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/23.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300) // 따로 높이 지정을 안 하면 최대한 가능한 한 많은 면적을 차지하려고 함.
                .ignoresSafeArea(edges: .top) // 위의 노치 바 까지 적용하게 해줌.
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) { //vertical
                
                // describe the view's content and layout.
                // To customize a SwiftUI view, you call methods called modifiers.
                // .font, .padding,.foregroundColor 같은 것들을 Modifier라고 한다.
                // 오른쪽에 뜨는 Xcode modifier을 통해서 수정할 수도 있다.
                // Text를 cmd + 클릭해서, 'Show SwiftUI Inspector을 선택해도 된다.
                Text("Turtle Rock")
                    .font(.title)// title : This applies the system font to the text so that it responds correctly to the user's preferred font sizes and settings.
                HStack { // horizontal
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer() // A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                    Text("Califonia")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                // Stack 단위로 그 안에 포함된 Text의 폰트 등 스타일을 일괄로 적용이 가능한 것으로 보인다.
                // When you apply a modifier to a layout view like a stack, SwiftUI applies the modifier to all the elements contained in the group.
                
                Divider() // 구분을 위한 띄기 + 구분선
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
