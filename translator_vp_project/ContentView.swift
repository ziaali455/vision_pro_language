//
//  ContentView.swift
//  translator_vp_project
//
//  Created by Ali Zia on 2/3/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        TabView {
                   
                   TranslationView()
                        .tabItem {
                            Image(systemName: "textformat")
                            Text("Home")
                        }
                    
                    
                }
            
        .frame(height:350)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
