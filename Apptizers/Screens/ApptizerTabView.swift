//
//  ApptizerTabView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct ApptizerTabView: View {
    var body: some View {
        TabView {
            ApptizerListView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            AccountView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Home")
                    }
                }
            
            OrderView()
                .tabItem {
                    VStack {
                        Image(systemName: "bag")
                        Text("Home")
                    }
                }
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    ApptizerTabView()
}
