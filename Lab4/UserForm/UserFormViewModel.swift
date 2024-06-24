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
    @Published var favoriteNumberText = ""
    @Published var location = ""
    @Published var cityName: String?
    var completion: (() -> Void)?
    
    private let saveUsersUseCase: SaveUsersUseCase
    private let loadUsersUseCase: LoadUsersUseCase
    private let localizationService: LocalizationServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(loadUsersUseCase: LoadUsersUseCase, saveUsersUseCase: SaveUsersUseCase, localizationService: LocalizationServiceProtocol) {
        self.loadUsersUseCase = loadUsersUseCase
        self.saveUsersUseCase = saveUsersUseCase
        self.localizationService = localizationService
        
        $favoriteNumberText
            .map { Int($0) ?? 0 }
            .assign(to: &$favoriteNumber)
        
    }
    
    
    
    func fetchCurrentLocation() {
        localizationService.requestLocation { [weak self] location, city in
            DispatchQueue.main.async {
                self?.location = location
                self?.cityName = city
            }
        }
    }
    
    func saveUser() {
        let newUser = User(name: name, favoriteColor: favoriteColor, birthDate: birthDate, favoriteCity: favoriteCity, favoriteNumber: favoriteNumber, location: location)
        var users = loadUsersUseCase.execute()
        users.append(newUser)
        saveUsersUseCase.execute(users: users)
        completion?()
        
        
        
    }
}
