//
//  UsersListViewModel.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var searchText: String = ""
    
    private let userDefaultsService: UserDefaultsService
    
    init(userDefaultsService: UserDefaultsService = UserDefaultsService()) {
        self.userDefaultsService = userDefaultsService
        loadUsers()
    }
    
    func loadUsers() {
        users = userDefaultsService.loadUsers()
    }
    
    func addUser(_ user: User) {
        users.append(user)
        userDefaultsService.saveUsers(users)
        loadUsers()
    }
    
    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
        userDefaultsService.saveUsers(users)
        loadUsers()
    }
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
