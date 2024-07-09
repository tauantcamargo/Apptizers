//
//  ApptizerListView.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import SwiftUI

struct ApptizerListView: View {
    @StateObject var viewModel = ApptizerListViewModel()
   
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach (viewModel.apptizers) { apptizer in
                        VStack(spacing: 20) {
                            ApptizerListItemView(apptizer: apptizer)
                                .onTapGesture {
                                    withAnimation(.easeIn) {
                                        viewModel.isShowingDetail = true
                                        viewModel.selectedApptizer = apptizer
                                    }
                                }
                            Divider()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Apptizers")
            }
            .onAppear {
                viewModel.getApptizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .disabled(viewModel.isShowingDetail)
            
            if viewModel.isShowingDetail {
                if let selectedApptizer = viewModel.selectedApptizer {
                    ApptizerDetailView(apptizer: selectedApptizer, isShowingDetail: $viewModel.isShowingDetail)
                        .transition(.push(from: .bottom))
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) {alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    ApptizerListView()
}
