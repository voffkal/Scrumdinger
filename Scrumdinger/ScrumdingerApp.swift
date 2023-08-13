//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Vladimir on 2023/07/06.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
//    @State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums){
                Task{
                    do{
                        try await store.save(scrums: store.scrums)
                    }
                    catch{
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
                .task {
                    do{
                        try await store.load()
                    }
                    catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.      xcrun simctl get_app_container booted com.example.apple-samplecode.Scrumdinger data     ")
                    }
                }
                .sheet(item: $errorWrapper) {
                
                    store.scrums = DailyScrum.sampleData
                } content: { wrapper in
                    ErrorView(errorWrapper: wrapper)
                }

        }
    }
}
