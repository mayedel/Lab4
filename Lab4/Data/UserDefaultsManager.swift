//
//  UserDefaultManager.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation

protocol DataManager {
    func saveUsers(_ users: [User])
    func loadUsers() -> [User]
}

class UserDefaultsManager: DataManager {
    private let userKey = "users"
    
    func saveUsers(_ users: [User]) {
        if let encodedUsers = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encodedUsers, forKey: userKey)
        }
    }
    
    func loadUsers() -> [User] {
        if let data = UserDefaults.standard.data(forKey: userKey),
           let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
            return decodedUsers
        }
        return []
    }
}
