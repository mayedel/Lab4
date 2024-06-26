//
//  UserFormView.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import SwiftUI

struct UserFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: UserFormViewModel
    @State private var offset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Usuario")) {
                    TextField("Nombre", text: $viewModel.name)
                    TextField("Color Preferido", text: $viewModel.favoriteColor)
                    DatePicker("Fecha de Nacimiento", selection: $viewModel.birthDate, displayedComponents: .date)
                         .datePickerStyle(CompactDatePickerStyle())
                    TextField("Ciudad Favorita", text: $viewModel.favoriteCity)
                    TextField("Número Favorito", text: $viewModel.favoriteNumberText).keyboardType(.numberPad)
                    TextField("Localización Actual", text: $viewModel.location)
                    TextField("Ciudad Actual", text: Binding(
                        get: { viewModel.cityName ?? "" },
                        set: { viewModel.cityName = $0 }
                    ))
                    
                    Button("Obtener Localización Actual") {
                        viewModel.fetchCurrentLocation()
                    }
                }
                
                Button("Guardar") {
                    viewModel.saveUser()
                    presentationMode.wrappedValue.dismiss()
                    viewModel.completion?()
                }
            }
            .navigationTitle("Añadir Usuario")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct UserFormView_Previews: PreviewProvider {
    static var previews: some View {
        UserFormView(viewModel: UserFormViewModel(loadUsersUseCase: LoadUsersUseCase(userDefaultsService: UserDefaultsService()), saveUsersUseCase: SaveUsersUseCase(userDefaultsService: UserDefaultsService()), localizationService: LocalizationService()))
    }
}
