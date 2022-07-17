//
//  EtheremWalletApp.swift
//  EtheremWallet
//
//  Created by ly on 2022/7/16.
//

import SwiftUI

@main
struct EtheremWalletApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
