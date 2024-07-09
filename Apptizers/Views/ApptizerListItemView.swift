//
//  ApptizerListItemView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct ApptizerListItemView: View {
    let apptizer: Apptizer
    
    var body: some View {
        HStack(spacing: 5) {
            AsyncImage(url: URL(string: apptizer.imageURL)) {AImage in
                AImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 120, height: 90)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
            }

            VStack(alignment: .leading) {
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(apptizer.price, specifier: "%.2f")")
                    .font(Font.system(size: 20))
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
            Spacer()
        }
    }
}

#Preview {
    ApptizerListItemView(apptizer: MockData.sampleApptizer)
        .previewLayout(.sizeThatFits)
        .padding()
}
