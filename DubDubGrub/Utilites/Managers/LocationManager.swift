//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by I9orila on 12.03.2023.
//

import Foundation
import CoreLocation
final class LocationManager: ObservableObject {
    @Published var places: [DDGPlaces]   = []
    
    @Published var newPlaces: [NewPlace] = []
    
   
}

