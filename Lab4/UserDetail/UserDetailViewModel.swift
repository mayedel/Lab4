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
    
    private let updateUserUseCase: UpdateUserUseCase
    
    init(user: User, updateUserUseCase: UpdateUserUseCase) {
            self.user = user
            self.updateUserUseCase = updateUserUseCase
        }
        
        func updateUser(_ updatedUser: User) {
            updateUserUseCase.execute(updatedUser: updatedUser)
        }
}
