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
    var completion: (() -> Void)?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información del Usuario")) {
                    TextField("Nombre", text: $viewModel.name)
                    TextField("Color Preferido", text: $viewModel.favoriteColor)
                    DatePicker("Fecha de Nacimiento", selection: $viewModel.birthDate, displayedComponents: .date)
                    TextField("Ciudad Favorita", text: $viewModel.favoriteCity)
                    TextField("Número Favorito", value: $viewModel.favoriteNumber, formatter: NumberFormatter())
                    TextField("Localización Actual", text: $viewModel.location)
                    
                    Button("Obtener Localización Actual") {
                        viewModel.fetchCurrentLocation()
                    }
                }
                
                Button("Guardar") {
                    viewModel.saveUser()
                    presentationMode.wrappedValue.dismiss()
                    completion?()
                }
            }
            .navigationTitle("Añadir Usuario")
        }
    }
}

struct UserFormView_Previews: PreviewProvider {
    static var previews: some View {
        UserFormView(viewModel: UserFormViewModel())
    }
}
