//
//  CleanseView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-26.
//

import SwiftUI

struct CleanseView: View {
    @EnvironmentObject var sb: Supabase
    let cleanse: Cleanse
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Palette.navy, Palette.green], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            Text("Cleanse penalty: \(cleanse.penalty)")
        }
    }
}

#Preview {
    CleanseView(cleanse: Mocks.cleanses[0])
}
