//
//  MapView.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel: MapViewModel

        init(viewModel: MapViewModel) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

    var body: some View {
        Map(coordinateRegion: $viewModel.region)
                 .navigationTitle("Mapa")
         }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: MapViewModel(city: "Madrid"))
    }
}
