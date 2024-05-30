//
//  UserDetailViewModel.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation
import Combine

class UserDetailViewModel: ObservableObject {
    @Published var user: User
    
    private let userDefaultsService: UserDefaultsService
    
    init(user: User, userDefaultsService: UserDefaultsService = UserDefaultsService()) {
        self.user = user
        self.userDefaultsService = userDefaultsService
    }
    
    func updateUser(_ updatedUser: User) {
        var users = userDefaultsService.loadUsers()
        if let index = users.firstIndex(where: { $0.id == updatedUser.id }) {
            users[index] = updatedUser
            userDefaultsService.saveUsers(users)
        }
    }
}
