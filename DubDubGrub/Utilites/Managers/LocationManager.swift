//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by I9orila on 12.03.2023.
//

import Foundation
final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
