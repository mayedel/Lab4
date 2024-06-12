//
//  UsersListView.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UserListViewModel(loadUsersUseCase: LoadUsersUseCase(userDefaultsService: UserDefaultsService()), saveUsersUseCase: SaveUsersUseCase(userDefaultsService: UserDefaultsService()))
    @State private var showingAddUser = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        Text(user.name)
                    }
                }
                .onDelete(perform: viewModel.deleteUser)
            }
            .navigationTitle("Usuarios")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddUser = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddUser) {
                UserFormView(viewModel: UserFormViewModel(loadUsersUseCase: LoadUsersUseCase(userDefaultsService: UserDefaultsService()), saveUsersUseCase: SaveUsersUseCase(userDefaultsService: UserDefaultsService())))
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Buscar usuarios")
            .onAppear {
                viewModel.loadUsers()
            }
        }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
