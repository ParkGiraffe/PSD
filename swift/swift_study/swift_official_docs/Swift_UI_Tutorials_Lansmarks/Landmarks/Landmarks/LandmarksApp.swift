//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/12.
//

import SwiftUI

@main //app's entry point
struct LandmarksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup<ContentView> {
            ContentView()
        }
    }
}
