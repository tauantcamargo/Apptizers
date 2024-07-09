//
//  AccountViewModel.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 09/07/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do {
            let encode = JSONEncoder()
            let encodedData = try encode.encode(user)
            userData = encodedData
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidForm
        }
    }
    
    func retrieveUser() {
        guard let userData else {
            return
        }
        
        do {
            let decode = JSONDecoder()
            let decodedData = try decode.decode(User.self, from: userData)
            user = decodedData
        } catch {
            alertItem = AlertContext.invalidForm
        }
    }
}
