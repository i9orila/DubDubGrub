//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @State private var isShowingOnboardView = true
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.237339,
                                                                                  longitude: 39.712246),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                          longitudeDelta: 0.05))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region).ignoresSafeArea()
            
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isShowingOnboardView) {
            OnboardView(isShowingOnboardView: $isShowingOnboardView)
        }
        .sheet(isPresented: $isShowingOnboardView) {
            OnboardView(isShowingOnboardView: $isShowingOnboardView)
        }
    }
}


struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}



