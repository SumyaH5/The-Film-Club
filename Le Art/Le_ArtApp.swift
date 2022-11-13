//
//  Le_ArtApp.swift
//  Le Art
//
//  Created by Sumya Hoque on 10/24/22.
//

import SwiftUI

@main
struct Le_ArtApp: App {
    var body: some Scene {
        WindowGroup {
            MainView().preferredColorScheme(.dark)
        }
    }
}

//import SwiftUI
//import FirebaseCore
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}
//
//@main
//struct Le_ArtApp: App {
//  // register app delegate for Firebase setup
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//
//
//  var body: some Scene {
//    WindowGroup {
//      NavigationView {
//          MainView().preferredColorScheme(.dark)()
//      }
//    }
//  }
//}
