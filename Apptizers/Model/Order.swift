//
//  Order.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 09/07/24.
//

import SwiftUI

final class Order: Observable, ObservableObject {
    @Published var items: [Apptizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
}
