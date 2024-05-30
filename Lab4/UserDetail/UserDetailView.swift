//
//  UserDetailView.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject var viewModel: UserDetailViewModel
    @State private var isEditing = false
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: UserDetailViewModel(user: user))
    }
    
    var body: some View {
        Form {
            Section(header: Text("Información del Usuario")) {
                TextField("Nombre", text: $viewModel.user.name)
                    .disabled(!isEditing)
                TextField("Color Preferido", text: $viewModel.user.favoriteColor)
                    .disabled(!isEditing)
                DatePicker("Fecha de Nacimiento", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    .disabled(!isEditing)
                TextField("Ciudad Favorita", text: $viewModel.user.favoriteCity)
                    .disabled(!isEditing)
                TextField("Número Favorito", value: $viewModel.user.favoriteNumber, formatter: NumberFormatter())
                    .disabled(!isEditing)
                TextField("Localización", text: $viewModel.user.location)
                    .disabled(!isEditing)
            }
            
            if isEditing {
                Button("Guardar Cambios") {
                    viewModel.updateUser(viewModel.user)
                    isEditing = false
                }
            }
            
            NavigationLink(destination: MapView(viewModel: MapViewModel(city: viewModel.user.favoriteCity))) {
                Text("Ver Ciudad en Mapa")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Detalles del Usuario")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(isEditing ? "Cancelar" : "Editar")
                }
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(name: "John Doe", favoriteColor: "Azul", birthDate: Date(), favoriteCity: "Madrid", favoriteNumber: 7, location: "40.416775, -3.703790"))
    }
}
