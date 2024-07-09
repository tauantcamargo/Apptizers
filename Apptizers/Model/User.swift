//
//  User.swift
//  Apptizers
//
//  Created by Tauan Tathiell Camargo on 09/07/24.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
