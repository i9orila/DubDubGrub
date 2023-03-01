//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
            TabView {
                NavigationView {
                    LocationMapView()
                }
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            LocationListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
                NavigationView {
                    ProfileView()
                }
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                .accentColor(.brandPrimary)
        }
        
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
