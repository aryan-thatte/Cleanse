//
//  Home.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-17.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sb: Supabase
    @State var cleanses: [Cleanse] = Mocks.cleanses
    
    var body: some View {
        ZStack {
            Palette.navy.edgesIgnoringSafeArea(.all)
            VStack {
                NavigationStack {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(cleanses) { cleanse in
                            Button(action: {
                                print("button clicked")
                            }) {
                                NavigationLink(value: cleanse) {
                                    Text(cleanse.name)
                                }
                            }
                            .frame(width: 150, height: 60)
                            .font(.title)
                            .foregroundColor(Palette.black)
                            .background(Palette.green)
                            .cornerRadius(10)
                        }
                    }
                    .border(Palette.white)
                    .navigationTitle("Cleanse")
                    .navigationDestination(for: Cleanse.self) { cleanse in
                        CleanseView(cleanse: cleanse)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
