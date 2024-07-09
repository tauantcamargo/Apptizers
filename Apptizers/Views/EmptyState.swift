//
//  EmptyState.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 09/07/24.
//

import SwiftUI

struct EmptyState: View {
    var image: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                
                Text(message)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
        
    }
}

#Preview {
    EmptyState(image: "emptystate", message: "Any placeholder text.")
}
