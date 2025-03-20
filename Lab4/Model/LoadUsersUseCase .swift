//
//  LoadUsersUseCase .swift
//  Lab4
//
//  Created by María Espejo on 12/6/24.
//

import Foundation
class LoadUsersUseCase {
    private let userDefaultsService: UserDefaultsService
    
    init(userDefaultsService: UserDefaultsService) {
        self.userDefaultsService = userDefaultsService
    }
    
    func execute() -> [User] {
        return userDefaultsService.loadUsers()
    }
}
