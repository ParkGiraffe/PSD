//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

@main // main atrribute identifies the app's entry point.
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
// Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view..
    

    var body: some Scene {
        WindowGroup {
            ContentView() //ContentView.Swift Scene 출력
                .environmentObject(modelData)

        }
    }
}
