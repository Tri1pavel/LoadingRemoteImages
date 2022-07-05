//
//  ContentView.swift
//  LRI
//
//  Created by Development on 05.07.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model: DrinkModel
    @State private var showingNetworkAlert = false
    
    var body: some View {
        List(model.items, id: \.idDrink) { item in
            Text("\(item.strDrink)")
        }
        .listStyle(PlainListStyle())
        .onAppear {
            model.getDrinks { error in
                if let _ = error {
                    showingNetworkAlert.toggle()
                }
            }
        }
        .alert(model.networkError ?? String(), isPresented: $showingNetworkAlert) {
            Button("Dismiss", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DrinkModel(networkAPI: NetworkLayer.shared)
        ContentView()
            .environmentObject(model)
    }
}
