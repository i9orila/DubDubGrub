//
//  DDGProfile.swift
//  DubDubGrub
//
//  Created by I9orila on 27.02.2023.
//

import SwiftUI
import Firebase

struct DDGProfile: Identifiable {
    
    
    static let kFirstName   = "firstName"
    static let kLastNAme    = "lastName"
    static let kAvatar      = "avatar"
    static let kCompanyName = "companyName"
    static let kBio         = "bio"
    static let kIsCheckIn   = "isCheckIn"
    
    var id: String
    var firstName: String
    var lastName: String
    var avatar: String
    var companyName: String
    var bio: String
    var isCheckIn: String?
    
    init(id: String, firstName: String, lastName: String, avatar: String, companyName: String, bio: String, isCheckIn: String? = nil) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.companyName = companyName
        self.bio = bio
        self.isCheckIn = isCheckIn
    }
}

//let id          = data["id"] as? String ?? ""
//let firstName   = data["firstName"] as? String ?? ""
//let lastName    = data["id"] as? String ?? ""
//let avatar      = data["id"] as? String ?? ""
//let companyName = data["id"] as? String ?? ""
//let bio         = data["id"] as? String ?? ""
//let isCheckIn   = data["id"] as? String ?? ""
