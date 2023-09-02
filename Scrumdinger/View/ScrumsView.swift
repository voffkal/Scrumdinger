//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Vladimir on 2023/07/06.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            List($scrums) {
                $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                }, label: {
                    Image(systemName: "plus")
                }).accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView, content: {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumVView: $isPresentingNewScrumView)
            })
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .inactive {
                    saveAction()
                }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
