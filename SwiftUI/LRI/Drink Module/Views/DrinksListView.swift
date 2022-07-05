//
//  DrinksListView.swift
//  LRI
//
//  Created by Development on 05.07.2022.
//

import SwiftUI

struct DrinksListView: View {
    @EnvironmentObject private var model: DrinkModel
    @State private var showingNetworkAlert = false
    
    var getData: Void {
        model.getDrinks { error in
            if let _ = error {
                showingNetworkAlert.toggle()
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            List {
                ForEach(model.items, id: \.idDrink) { item in
                    DrinkRowView(item: item)
                        .frame(width: geometry.size.width, height: 230.0)
                        .listRowInsets(.init())
                        .clipped()  
                }
            }
            .listStyle(PlainListStyle())
            .onAppear {
                getData
            }
            .refreshable {
                getData
            }
            .alert(model.networkError ?? String(), isPresented: $showingNetworkAlert) {
                Button("Dismiss", role: .cancel) { }
            }
        }
    }
}

struct DrinksListView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DrinkModel(networkAPI: NetworkLayer.shared)
        DrinksListView()
            .environmentObject(model)
    }
}
