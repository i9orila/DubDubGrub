//
//  LocationMapViewModel.swift
//  DubDubGrub
//
//  Created by I9orila on 12.03.2023.
//

import Foundation
import MapKit
import Firebase

final class LocationMapViewModel: ObservableObject {
    @Published var firestore = Firestore.firestore()
    @Published var alertItem: AlertItem?
    @Published var isShowingOnboardView = true
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.237339,
                                                                                  longitude: 39.712246),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                          longitudeDelta: 0.05))
}
