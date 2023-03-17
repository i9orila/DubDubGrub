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

    @Published var alertItem: AlertItem?
    @Published var isShowingOnboardView = true
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.237339,
                                                                                  longitude: 39.712246),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                          longitudeDelta: 0.05))
    
      private var db = Firestore.firestore()
     
      
      func addPlace(place: DDGPlaces) {
          do {
              let _ = try db.collection("DDGPlaces").addDocument(from: place)
          }
          catch {
              print(error)
          }
      }
      
      
    func getLocations(for locationManager: LocationManager) {
          db.collection("DDGPlaces").addSnapshotListener {(querySnapshot, error) in
              guard let documents = querySnapshot?.documents else {
                  print("No documents")
                  return
              }

              locationManager.places = documents.compactMap { (queryDocumentSnapshot) -> DDGPlaces? in
                  return try? queryDocumentSnapshot.data(as: DDGPlaces.self)
                  

              }
              locationManager.newPlaces = documents.compactMap { (queryDocumentSnapshot) -> NewPlace? in
                  guard let docData = try? queryDocumentSnapshot.data(as: DDGPlaces.self) else { return nil }
                  let coordinate = CLLocationCoordinate2D(latitude: docData.location.latitude,
                                                          longitude: docData.location.longitude)
                  let newPlace = NewPlace(location: coordinate)
                  return newPlace
              
              }
             
          }
      }
}


