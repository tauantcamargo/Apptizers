//
//  ApptizerDetailView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 09/07/24.
//

import SwiftUI

struct ApptizerDetailView: View {
    @EnvironmentObject var order: Order
    let apptizer: Apptizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: apptizer.imageURL)) {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
            } placeholder: {
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 225)
                        .foregroundStyle(.white)
                    ProgressView()
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                        .foregroundStyle(.brandPrimary)
                }
                
            }
            
            VStack {
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(apptizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    VStack(spacing: 5) {
                        Text("Calories")
                            .font(.caption)
                            .bold()
                        Text("\(apptizer.calories)")
                            .foregroundStyle(.secondary)
                            .italic()
                            .fontWeight(.semibold)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protein")
                            .font(.caption)
                            .bold()
                        Text("\(apptizer.protein)")
                            .foregroundStyle(.secondary)
                            .italic()
                            .fontWeight(.semibold)
                    }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .font(.caption)
                            .bold()
                        Text("\(apptizer.carbs)")
                            .foregroundStyle(.secondary)
                            .italic()
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    order.items.append(apptizer)
                    isShowingDetail = false
                }
            } label: {
                Text("$\(apptizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
                    .background(.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(
            Button {
                withAnimation(.easeOut) {
                    isShowingDetail = false
                }
            } label: {
                ZStack(alignment: .center) {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.black)
                        .bold()
                }
                .padding(.trailing, 8)
                .padding(.top, 8)
            }, 
            alignment: .topTrailing
        )
    }
}

#Preview {
    ApptizerDetailView(apptizer: MockData.sampleApptizer, isShowingDetail: Binding.constant(true))
}
