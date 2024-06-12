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
    
    private let saveUsersUseCase: SaveUsersUseCase
    private let loadUsersUseCase: LoadUsersUseCase
       private let localizationService: LocalizationService
       
       init(loadUsersUseCase: LoadUsersUseCase, saveUsersUseCase: SaveUsersUseCase, localizationService: LocalizationService = LocalizationService()) {
           self.loadUsersUseCase = loadUsersUseCase
           self.saveUsersUseCase = saveUsersUseCase
           self.localizationService = localizationService
       }
       
    
    func fetchCurrentLocation() {
        localizationService.requestLocation { [weak self] location in
            self?.location = location
        }
    }
    
    func saveUser() {
        let newUser = User(name: name, favoriteColor: favoriteColor, birthDate: birthDate, favoriteCity: favoriteCity, favoriteNumber: favoriteNumber, location: location)
        var users = loadUsersUseCase.execute()
        users.append(newUser)
        saveUsersUseCase.execute(users: users)
        //completion?()
        
        
        
    }
}
