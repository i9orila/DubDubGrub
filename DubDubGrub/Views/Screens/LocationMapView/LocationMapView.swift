//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI
import MapKit
import FirebaseFirestore


struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()
    
    
    
    
    var body: some View {
        ZStack {
//            Map(coordinateRegion: $viewModel.region, annotationItems: locationManager.places){ location in
//                MapMarker(coordinate: location.location, tint: .brandPrimary)
        //    }
            Map(coordinateRegion: $viewModel.region, annotationItems: locationManager.newPlaces) { location in
                MapMarker(coordinate: location.location, tint: .brandPrimary)
            }
            .ignoresSafeArea()

            
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                Spacer()
            }
        }

        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        })
        .onAppear() {
            if locationManager.places.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }

        
//        .fullScreenCover(isPresented: $viewModel.isShowingOnboardView) {
//            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
//        }
        
//        .sheet(isPresented: $viewModel.isShowingOnboardView) {
//            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
//        }
    }
}


struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}



