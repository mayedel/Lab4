//
//  UserDefaultService.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation

class UserDefaultsService {
    private let dataManager: DataManager
    
    init(dataManager: DataManager = UserDefaultsManager()) {
        self.dataManager = dataManager
    }
    
    func saveUsers(_ users: [User]) {
        dataManager.saveUsers(users)
    }
    
    func loadUsers() -> [User] {
        return dataManager.loadUsers()
    }
}
