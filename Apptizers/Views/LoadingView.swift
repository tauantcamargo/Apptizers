//
//  LoadingView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .scaleEffect(x: 2, y: 2, anchor: .center)
                .foregroundStyle(Color.brandPrimary)
        }
    }
}

#Preview {
    LoadingView()
}
