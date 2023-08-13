//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Vladimir on 2023/07/10.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumVView: Bool
 
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumVView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                              scrums.append(newScum)
                            isPresentingNewScrumVView = false
                            
                        }
                    }
                }
        }
    }
}
    
    
struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData),
                      isPresentingNewScrumVView: .constant(true))
    }
}
