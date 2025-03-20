//
//  User.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var name: String
    var favoriteColor: String
    var birthDate: Date
    var favoriteCity: String
    var favoriteNumber: Int
    var location: String
}
