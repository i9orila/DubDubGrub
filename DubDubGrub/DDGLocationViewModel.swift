//
//  DDGLocationViewModel.swift
//  DubDubGrub
//
//  Created by I9orila on 26.02.2023.
//

import SwiftUI
import Firebase

 class DDGLocationViewModel: ObservableObject {
    @Published var dlocations = [DDGLocation]()
   // @Published var dDGProfile: [DDGProfile] = []
      private var db = Firestore.firestore()
    
//    init() {
//        fetchData()
//    }
//
//    func fetchData() {
//        dlocations.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("DDGLocation")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print(error!.localizedDescription)
//                return
//            }
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//
//                    let id = data["id"] as? String ?? ""
//                    let adress = data["adress"] as? String ?? ""
//                    let bannerAsset = data["bannerAsset"] as? String ?? ""
//                    let description = data["description"] as? String ?? ""
//                    let location = data["location"] as? String ?? ""
//                    let name = data["name"] as? String ?? ""
//                    let phoneNumber = data["phoneNumber"] as? String ?? ""
//                    let websiteURL = data["websiteURL"] as? String ?? ""
//                    let squareAsset = data["squareAsset"] as? String ?? ""
//
//                    let dlocation = DDGLocation(id: id, adress: adress, bannerAsset: bannerAsset, description: description, location: location, name: name, phoneNumber: phoneNumber, websiteURL: websiteURL, squareAsset: squareAsset)
//                    self.dlocations.append(dlocation)
//                }
//            }
//        }
//
//    }
    
    func fetchData() {
        db.collection("DDGLocation").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.dlocations = documents.map {(queryDocumentSnapshot) -> DDGLocation in
                let data =  queryDocumentSnapshot.data()

                let adress = data[DDGLocation.kAdress] as? String ?? ""
                let bannerAsset = data[DDGLocation.kBannerAsset] as? String ?? ""
                let description = data[DDGLocation.kDescription] as? String ?? ""
                let location = data[DDGLocation.kLocation] as? String ?? ""
                let name = data[DDGLocation.kName] as? String ?? ""
                let phoneNumber = data[DDGLocation.kPhoneNumber] as? String ?? ""
                let websiteURL = data[DDGLocation.kWebsiteURL] as? String ?? ""
                let squareAsset = data[DDGLocation.kSquareAsset] as? String ?? ""

                return DDGLocation(adress: adress, bannerAsset: bannerAsset, description: description, location: location, name: name, phoneNumber: phoneNumber, websiteURL: websiteURL, squareAsset: squareAsset)

            }
        }
    }
}

