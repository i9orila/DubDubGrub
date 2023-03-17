//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject var viewModel =  LocationMapViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(locationManager.places) { place in
                    NavigationLink(destination: LocationDetailView(location: place)) {
                        LocationCell(location: place)
                        
                    }
                    
                }
            }
            //.listStyle(.plain)
            .navigationTitle("Grub Spots")
            
        }
        
    }
    
    struct LocationListView_Previews: PreviewProvider {
        static var previews: some View {
            LocationListView()
                .preferredColorScheme(.light)
        }
    }
}




