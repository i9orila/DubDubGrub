//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI
import MapKit
import Firebase

struct LocationMapView: View {
    @EnvironmentObject private var locationManager: DDGLocationViewModel
    @StateObject private var viewModel = LocationMapViewModel()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, annotationItems: locationManager.dlocations) { dlocation in
                MapMarker(coordinate: dlocation.location.coordinate, tint: .brandPrimary)
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
        
        .fullScreenCover(isPresented: $viewModel.isShowingOnboardView) {
            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
        }
        
        .sheet(isPresented: $viewModel.isShowingOnboardView) {
            OnboardView(isShowingOnboardView: $viewModel.isShowingOnboardView)
        }
    }
}


struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}



