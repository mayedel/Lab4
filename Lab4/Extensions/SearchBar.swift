//
//  SearchBar.swift
//  Lab4
//
//  Created by María Espejo on 23/5/24.
//

//import Foundation
//import SwiftUI
//import UIKit
//
//struct SearchBar: UIViewRepresentable {
//    @Binding var text: String
//
//    class Coordinator: NSObject, UISearchBarDelegate {
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            text = searchText
//        }
//
//        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//            searchBar.setShowsCancelButton(true, animated: true)
//        }
//
//        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//            searchBar.setShowsCancelButton(false, animated: true)
//        }
//
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.text = ""
//            text = ""
//            searchBar.resignFirstResponder()
//        }
//
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.resignFirstResponder()
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(text: $text)
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.placeholder = "Buscar"
//        return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        uiView.text = text
//    }
//}
