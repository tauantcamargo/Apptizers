//
//  Apptizer.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 08/07/24.
//

import Foundation

struct Apptizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct ApptizerResponse: Decodable {
    let request: [Apptizer]
}

struct MockData {
    static let sampleApptizer = Apptizer(id: 0001, name: "Test Apptizer", description: "This is a description sample for my apptizer", price: 13.99, imageURL: "", calories: 13, protein: 12, carbs: 13)
    
    static let appetizers = [sampleApptizer, sampleApptizer, sampleApptizer, sampleApptizer]
    
    static let orderItem1 = Apptizer(id: 0001, name: "Test Apptizer", description: "This is a description sample for my apptizer", price: 13.99, imageURL: "", calories: 13, protein: 12, carbs: 13)
    static let orderItem2 = Apptizer(id: 0002, name: "Test Apptizer2", description: "This is a description sample for my apptizer", price: 13.99, imageURL: "", calories: 13, protein: 12, carbs: 13)
    static let orderItem3 = Apptizer(id: 0003, name: "Test Apptizer3", description: "This is a description sample for my apptizer", price: 13.99, imageURL: "", calories: 13, protein: 12, carbs: 13)
    static let orderItem4 = Apptizer(id: 0004, name: "Test Apptizer4", description: "This is a description sample for my apptizer", price: 13.99, imageURL: "", calories: 13, protein: 12, carbs: 13)
    
    static let orderApptizers = [orderItem1, orderItem2, orderItem3, orderItem4]
}
