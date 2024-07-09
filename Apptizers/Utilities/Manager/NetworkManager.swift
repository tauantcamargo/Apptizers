//
//  NetworkManager.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getApptizers() async throws -> [Apptizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decoder = JSONDecoder()
                
                let decodedResponse = try decoder.decode(ApptizerResponse.self, from: data)
                
                return decodedResponse.request
            } catch {
                throw APError.invalidData
            }
            
        } catch {
            throw APError.invalidResponse
        }
    }
}
