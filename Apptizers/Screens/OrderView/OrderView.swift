//
//  OrderView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach (order.items) { apptizer in
                            VStack(spacing: 20) {
                                ApptizerListItemView(apptizer: apptizer)
                                    .swipeActions() {
                                        Button(role: .destructive) {
                                            if let index = order.items.firstIndex(where: {
                                                $0.id == apptizer.id
                                            }) {
                                                order.items.remove(at: index)
                                            }
                                        } label: {
                                            Label("Remove", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }
                                Divider()
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        print("Order")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(width: 260, height: 50)
                            .foregroundStyle(.white)
                            .background(.brandPrimary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(image: "emptystate", message: "You have no item in your order.\nPlease add an apptizer!")
                }
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView()
}
