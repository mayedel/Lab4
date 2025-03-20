//
//  UpdateUserUseCase.swift
//  Lab4
//
//  Created by María Espejo on 12/6/24.
//

import Foundation
class UpdateUserUseCase {
    private let userDefaultsService: UserDefaultsService
    
    init(userDefaultsService: UserDefaultsService) {
        self.userDefaultsService = userDefaultsService
    }
    
    func execute(updatedUser: User) {
        var users = userDefaultsService.loadUsers()
        if let index = users.firstIndex(where: { $0.id == updatedUser.id }) {
            users[index] = updatedUser
            userDefaultsService.saveUsers(users)
        }
    }
}

