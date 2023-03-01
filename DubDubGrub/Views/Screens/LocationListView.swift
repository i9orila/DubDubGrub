//
//  LocationListView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI

struct LocationListView: View {
    @StateObject var viewModel =  DDGLocationViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dlocations, id: \.id) { dlocation in
                    NavigationLink(destination: LocationDetailView(dlocation: dlocation)) {
                        LocationCell(dlocation: dlocation)
                        
                    }
                    
                }
            }
            //.listStyle(.plain)
            .navigationTitle("Grub Spots")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
        
    }
    
    struct LocationListView_Previews: PreviewProvider {
        static var previews: some View {
            LocationListView()
                .preferredColorScheme(.light)
        }
    }
}




