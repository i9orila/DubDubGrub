//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by I9orila on 24.02.2023.
//

import SwiftUI
//import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
 func application (_ application: UIApplication,
 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


//@main
//struct DubDubGrubApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            AppTabView()
//        }
//    }
//}

@main
struct FavouritesApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   // @StateObject var viewModel = DDGLocationViewModel()
  var body: some Scene {
    WindowGroup {
      NavigationView {
        AuthenticatedView {
          Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150 , height: 150)
            
  

          Text("Welcome to Favourites!")
            .font(.title)
          Text("You need to be logged in to use this app.")
        } content: {
            AppTabView()
          Spacer()
        }
      }
    }
  }
}

