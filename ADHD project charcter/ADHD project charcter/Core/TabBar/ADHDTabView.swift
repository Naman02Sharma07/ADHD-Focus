////
////  ThreadsTabView.swift
////  ADHD project charcter
////
////  Created by student on 21/11/24.
////
//
import SwiftUI

struct ADHDTabView: View {
    @State private var selectedTab = 0;
    @State private var schowCreateThreadView = false;
    
//    init() {
//            // Customize the appearance of the Tab Bar
//            UITabBar.appearance().backgroundColor = UIColor.white // Set tab bar background color to white (or any other color)
//            UITabBar.appearance().barTintColor = UIColor.white // Set the bar tint color (if you need)
//            UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Set the color for unselected tabs
//        }
    
    
    
    var body: some View {
        TabView{
            CombinedView()
                .tabItem {
                Image(systemName: "clock.fill")
                .environment(\.symbolVariants, .fill)
                                }
                .tag(0)
                .onAppear{selectedTab = 0}
            
            Rewards()
                .tabItem {
                    Image(systemName: "gift.fill")
                }
                .onAppear{selectedTab = 1}
                .tag(1)
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants,selectedTab == 2 ? .fill : .none)
                }
                .onAppear{selectedTab = 4}
                .tag(4)
        }
        .onChange(of: selectedTab, perform: {
            newValue in schowCreateThreadView = selectedTab == 2
        })
        .sheet(isPresented: $schowCreateThreadView, onDismiss: {
            selectedTab = 0
        },content: {
//            CreateThreadView()
        })
        .tint(.black)
        .background(Color.red // Background for the tab bar
//            .edgesIgnoringSafeArea(.bottom)
        )
    }
}

#Preview {
    ADHDTabView()
}

//import SwiftUI
//
//struct ADHDTabView: View {
//    @State private var selectedTab = 0
//    @State private var showCreateThreadView = false
//    
//    var body: some View {
//        TabView(selection: $selectedTab) { // Use selection to bind the tab view
//            // Combined View tab
//             // Ensure the correct tag here (0 for CombinedView)
//            CombinedView()
//            .tabItem {
//            Image(systemName: "clock.fill")
//            .environment(\.symbolVariants, .fill)
//            }
//            .tag(0)
//            .onAppear{selectedTab = 0}
//            
//            // Rewards tab
//            Text("Rewards")
//                .tabItem {
//                    Image(systemName: "gift.fill")
//                    Text("Rewards")
//                }
//                .tag(1) // Tag for Rewards
//            
//            // Profile tab
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//                .tag(2) // Tag for Profile
//        }
//        .onChange(of: selectedTab) { newValue in
//            // Handle any changes to selected tab
//            showCreateThreadView = selectedTab == 2 // Trigger sheet if Profile is selected
//        }
//        .sheet(isPresented: $showCreateThreadView, onDismiss: {
//            selectedTab = 0 // Reset to the first tab on dismiss
//        }, content: {
////            CreateThreadView() // Uncomment and implement your CreateThreadView
//        })
//        .tint(.black)
//        .background(Color.white.opacity(0.9)
//            .edgesIgnoringSafeArea(.bottom)
//        )
//    }
//}
//
//#Preview {
//    ADHDTabView()
//}
