//
//  ApptizersApp.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

@main
struct ApptizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ApptizerTabView()
                .environment(order)
        }
    }
}
