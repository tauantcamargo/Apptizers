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
        self.isLoading = true
        NetworkManager.shared.getApptizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let apptizers):
                    self.apptizers = apptizers
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
