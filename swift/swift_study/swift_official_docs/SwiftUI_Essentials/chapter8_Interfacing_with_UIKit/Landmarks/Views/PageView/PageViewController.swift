//
//  PageViewController.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/12/02.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
            // orientation: 방향
    
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
//The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks.

