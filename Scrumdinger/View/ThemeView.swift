//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Vladimir on 2023/07/07.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(6)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .foregroundStyle(theme.accentColor)
    }
}

#Preview {
    ThemeView(theme: Theme.buttercupS)
}
