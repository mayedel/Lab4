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
    
    private let loadUsersUseCase: LoadUsersUseCase
    private let saveUsersUseCase: SaveUsersUseCase
    
    init(loadUsersUseCase: LoadUsersUseCase, saveUsersUseCase: SaveUsersUseCase) {
        self.loadUsersUseCase = loadUsersUseCase
        self.saveUsersUseCase = saveUsersUseCase
        loadUsers()
    }
    
    func loadUsers() {
        self.users = loadUsersUseCase.execute()
    }
    
    func addUser(_ user: User) {
        users.append(user)
        saveUsersUseCase.execute(users: users)
        loadUsers()
    }
    
    func deleteUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
        saveUsersUseCase.execute(users: users)
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
