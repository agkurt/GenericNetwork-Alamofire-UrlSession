//
//  MVVMExampleApp.swift
//  MVVMExample
//
//  Created by Ahmet Göktürk Kurt on 6.01.2024.
//

import SwiftUI

@main
struct MVVMExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(apiService: UrlSessionApiService.shared)
        }
    }
}
