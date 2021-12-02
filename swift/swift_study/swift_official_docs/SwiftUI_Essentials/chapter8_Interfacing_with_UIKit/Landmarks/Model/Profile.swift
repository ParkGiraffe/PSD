//
//  Profile.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/11/02.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation


struct Profile {
    //멤버 변수
    //default 값 설정.
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
            case summer = "🌞"
            case autumn = "🍂"
            case winter = "☃️"
            
        var id: String { self.rawValue }
    }
}
