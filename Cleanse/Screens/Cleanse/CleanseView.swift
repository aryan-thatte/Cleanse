//
//  CleanseView.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-26.
//

import SwiftUI

struct CleanseView: View {
    let cleanse: Cleanse
    
    var body: some View {
        Text("Cleanse penalty: \(cleanse.penalty)")
    }
}

#Preview {
    CleanseView(cleanse: Mocks.cleanses[0])
}
