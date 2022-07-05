//
//  LRIApp.swift
//  LRI
//
//  Created by Development on 05.07.2022.
//

import SwiftUI

@main
struct LRIApp: App {
    @StateObject
    private var model: DrinkModel = DrinkModel(networkAPI: NetworkLayer.shared)
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
