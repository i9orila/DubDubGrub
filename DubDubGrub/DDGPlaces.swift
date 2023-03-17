//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by I9orila on 26.02.2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import MapKit


struct DDGPlaces: Identifiable, Codable {
    
    @DocumentID var id: String? = UUID().uuidString
    var adress: String
    var bannerAsset: String
    var description: String
    var location: GeoPoint
    var name: String
    var phoneNumber: String
    var squareAsset: String
    var websiteURL: String
    
    
}

//struct Coordinate: Codable {
//    var latitude: Double
//    var longitude: Double
//}

struct NewPlace: Identifiable {
    
    var id: String? = UUID().uuidString
//    var adress: String
//    var bannerAsset: String
//    var description: String
    var location: CLLocationCoordinate2D
//    var name: String
//    var phoneNumber: String
//    var squareAsset: String
//    var websiteURL: String
}

