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
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username (textHolder)", text: $profile.username)
                
                // create a text field with a label and a binding to a value
            
                
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
