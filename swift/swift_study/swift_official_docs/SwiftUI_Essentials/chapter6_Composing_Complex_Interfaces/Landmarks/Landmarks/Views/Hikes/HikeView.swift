/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI


extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //AnyTransition.slide
        
        //AnyTransition.move(edge: .trailing)
        // the graph slides in and out from the same side.
        
        //Use the asymmetric(insertion:removal:) modifier to provide different transitions for when the view appears and disappears.
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        
        let removal = AnyTransition.scale.combined(with: .opacity)
        
        return .asymmetric(insertion: insertion, removal: removal)        
    }
}


struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        //.animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        //.animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
                    
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
