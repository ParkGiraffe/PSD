//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/09/01.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    // 바인딩을 사용하기 때문에 이 view 내에서 변경한 내용이 데이터 소스로 다시 전파됩니다.
    // 'Binding' controls the storage for a value, so you can pass data around to diffrent views that need to read or write it.
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
