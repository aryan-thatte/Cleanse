//
//  Home.swift
//  Cleanse
//
//  Created by Aryan Thatte on 2023-12-17.
//

import Foundation
import SwiftUI

struct CleanseListView: View {
    @EnvironmentObject var sb: Supabase
    @State var cleanses: [Cleanse] = []
    @State private var animateGradient: Bool = false
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                // https://medium.com/@danishandersjensen/swiftui-gradient-99e57f8e3e27#:~:text=LinearGradient%20is%20a%20SwiftUI%20view,leading%20or%20.
                LinearGradient(colors: [Palette.blue, Palette.green], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 15) {
                            if isLoading {
                                Text("Loading...")
                            } else {
                                ForEach(cleanses) { cleanse in
                                    NavigationLink(value: cleanse) {
                                        GroupBox(label: Text("\(cleanse.name)").lineLimit(1), content: {
                                            Text(cleanse.end_date, style: .relative)
                                                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                                                .lineLimit(1)
                                        })
                                        .backgroundStyle(Palette.navy)
                                        .foregroundStyle(Palette.white)
                                        .frame(width: .infinity, height: .infinity)
                                        .shadow(radius: 4, y: 3)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Cleanses")
            .navigationDestination(for: Cleanse.self) { cleanse in
                CleanseDetailsView(cleanse: cleanse)
            }
        }
        .accentColor(Palette.white)
        .task {
            if cleanses == [] {
                self.cleanses = await sb.fetchUserCleanses()
            }
            self.isLoading = false
        }
    }
}

#Preview {
    CleanseListView(cleanses: Mocks.cleanses)
        .environmentObject(Supabase.shared)
}
