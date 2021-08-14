//
//  ContentView.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

struct ContentView: View { // View protocol.
    // describe the view's content and layout.
    var body: some View {
        // To customize a SwiftUI view, you call methods called modifiers.
        // .font, .padding,.foregroundColor 같은 것들을 Modifier라고 한다.
        // 오른쪽에 뜨는 Xcode modifier을 통해서 수정할 수도 있다.
        // Text를 cmd + 클릭해서, 'Show SwiftUI Inspector을 선택해도 된다.
        VStack(alignment: .leading) { //vertical
            Text("Turtle Rock")
                .font(.title)// title : This applies the system font to the text so that it responds correctly to the user's preferred font sizes and settings.
            HStack { // horizontal
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer() // A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
                Text("Califonia")
                    .font(.subheadline)
            }
        }
        .padding()
            
    }
}

struct ContentView_Previews: PreviewProvider {
    // declares a previwe for that view
    static var previews: some View {
        ContentView()
    }
}
