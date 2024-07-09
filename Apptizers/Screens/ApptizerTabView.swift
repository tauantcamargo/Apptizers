//
//  ApptizerTabView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct ApptizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            ApptizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    ApptizerTabView()
        .environment(Order())
}
