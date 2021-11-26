//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/11/23.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username (textHolder)", text: $profile.username)
                // create a text field with a label and a binding to a value
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in Text(season.rawValue).tag(season)
                        
                    }
                    
                }
                .pickerStyle(.segmented)
                
                DatePicker(selection: $profile.goalDate, in: dataRange, displayedComponents: .date) {
                    Text("Goal Date").bold()
                }
                    
            }
        
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
