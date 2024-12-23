//
//  ADHD_project_charcterApp.swift
//  ADHD project charcter
//
//  Created by student on 21/11/24.
//

//import SwiftUI
//import FirebaseCore

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}

//@MainActor
//struct /*ADHD_project_charcterApp:*/ App {
////    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI

@main
struct ADHD_project_charcterApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(appUser: .constant(nil))  // Start with LoginView
//            ADHDTabView()
        }
    }
}

