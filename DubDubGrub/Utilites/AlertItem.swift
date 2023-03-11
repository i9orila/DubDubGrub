//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by I9orila on 11.03.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - MapView Errors
    
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                            message: Text("Unable to retrive locations at this time. \n Please try again."),
                                            dismissButton: .default(Text("OK")))
}
