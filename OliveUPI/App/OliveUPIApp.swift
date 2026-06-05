//
//  OliveUPIApp.swift
//  OliveUPI
//
//  Created by Shivanand Koli on 05/06/26.
//

import SwiftUI

@main
struct OliveUPIApp: App {

    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}
