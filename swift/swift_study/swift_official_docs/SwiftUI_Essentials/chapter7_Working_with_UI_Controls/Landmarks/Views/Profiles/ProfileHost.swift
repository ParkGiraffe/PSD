//
//  ProfileHost.swift.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/11/02.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                if editMode?.wrappedValue == .active {
                    if #available(iOS 15.0, *) {
                        //Button 컴포넌트가 IOS 15.0부터 지원된다는 거 같은데 추가조사 필요.
                        Button("Cancel", role: .cancel) {
                            draftProfile = modelData.profile
                            editMode?.animation().wrappedValue = .inactive
                        }
                    } else {
                        // Fallback on earlier versions
                    }
                }
                Spacer()
                EditButton()
                // EditButton toggles the envrionment's editMode value on and off.
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        //edit버튼을 누르면 edit페이지 안의 draftProfile 변수에 현재 계정데이터를 덮어 씀
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        //edit page에서 Done 버튼을 누르고 나오면, edit page 안의 draftProfile 데이터를 바깥 modelData.profile에 집어 넣음.
                        modelData.profile = draftProfile
                    }
            }
            }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
