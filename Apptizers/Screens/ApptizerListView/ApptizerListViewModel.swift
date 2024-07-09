//
//  ApptizerListViewModel.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import Foundation

final class ApptizerListViewModel: ObservableObject {
    @Published var apptizers: [Apptizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedApptizer: Apptizer?
    
    func getApptizers() {
        isLoading = true
       
        Task {
            do {
                apptizers = try await NetworkManager.shared.getApptizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
