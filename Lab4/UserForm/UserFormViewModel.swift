//
//  UserFormViewModel.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import Foundation
import Combine

class UserFormViewModel: ObservableObject {
    @Published var name = ""
    @Published var favoriteColor = ""
    @Published var birthDate = Date()
    @Published var favoriteCity = ""
    @Published var favoriteNumber = 0
    @Published var location = ""
    var completion: (() -> Void)?
    
    private let userDefaultsService: UserDefaultsService
    private let localizationService: LocalizationService
    
    init(userDefaultsService: UserDefaultsService = UserDefaultsService(), localizationService: LocalizationService = LocalizationService()) {
        self.userDefaultsService = userDefaultsService
        self.localizationService = localizationService
    }
    
    func fetchCurrentLocation() {
        localizationService.requestLocation { [weak self] location in
            self?.location = location
        }
    }
    
    func saveUser() {
        let newUser = User(name: name, favoriteColor: favoriteColor, birthDate: birthDate, favoriteCity: favoriteCity, favoriteNumber: favoriteNumber, location: location)
        var users = userDefaultsService.loadUsers()
        users.append(newUser)
        userDefaultsService.saveUsers(users)
        completion?()
    }
}
