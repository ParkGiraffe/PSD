//
//  ContentView.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

struct ContentView: View { // View protocol.
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
        
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    // declares a previwe for that view
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
        // Update the ContentView preview to add the model object to the environment, which makes the object available to any subview
        // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
        // 여기에서 environment로 model object를 전달해준다고 설정하지 않으면, model object를 필요로하는 하위 view에서 오류가 발생하는 것 같음.
        // 그래서 LandmarksApp.Swift에서 ModelData 인스턴스를 불러옴.
    }
}
