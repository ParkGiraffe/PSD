//
//  ContentView.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

struct ContentView: View { // View protocol
    // describe the view's content and layout.
    var body: some View {
        Text("Hello, ParkGiraffe")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    // declares a previwe for that view
    static var previews: some View {
        ContentView()
    }
}
