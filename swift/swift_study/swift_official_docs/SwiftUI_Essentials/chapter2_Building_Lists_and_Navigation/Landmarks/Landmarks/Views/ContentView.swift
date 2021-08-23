//
//  ContentView.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

struct ContentView: View { // View protocol.
    
    
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    // declares a previwe for that view
    static var previews: some View {
        ContentView()
    }
}
