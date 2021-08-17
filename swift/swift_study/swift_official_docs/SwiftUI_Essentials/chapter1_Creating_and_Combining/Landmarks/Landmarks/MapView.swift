//
//  MapView.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/08/16.
//

import SwiftUI
import MapKit

struct MapView: View {
    // use the @State attribute to establish a source of truth for data in your app that you can modify from more than one view.
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    
    var body: some View {
        // Map은 프리뷰에서, 라이브 프리뷰를 켜야 실제 지도 위치를 파악할 수 있다.
        Map(coordinateRegion: $region) //By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.
        // 상태 변수 앞에 $를 붙이면 기본 값에 대한 참조와 같은 바인딩을 전달합니다. 사용자가 지도와 상호 작용할 때 지도는 현재 사용자 인터페이스에 표시되는 지도 부분과 일치하도록 영역 값을 업데이트합니다.
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
