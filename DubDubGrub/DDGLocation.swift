//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by I9orila on 26.02.2023.
//

import SwiftUI
import Firebase

struct DDGLocation: Identifiable {
    
    static let kAdress         = "adress"
    static let kBannerAsset    = "bannerAsset"
    static let kDescription    = "description"
    static let kLocation       = "location"
    static let kName           = "name"
    static let kPhoneNumber    = "phoneNumber"
    static let kWebsiteURL     = "websiteURL"
    static let kSquareAsset    = "squareAsset"
    
    
    var id: String = UUID().uuidString
    var adress: String
    var bannerAsset: String
    var description: String
    var location: String
    var name: String
    var phoneNumber: String
    var websiteURL: String
    var squareAsset: String

    
    
    
}


//var id: String = UUID().uuidString
