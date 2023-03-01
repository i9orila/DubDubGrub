//
//  SwiftUIView.swift
//  DubDubGrub
//
//  Created by I9orila on 26.02.2023.
//

import SwiftUI

struct SwiftUIView: View {
    @EnvironmentObject var dataManager: DDGLocationViewModel
    
    var body: some View {
        NavigationView {
            List(dataManager.dlocations, id: \.id) { location in
                Text(location.name)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
