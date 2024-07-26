//
//  ContentView.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State var defaultTag = "solar"
    
    var body: some View{
        HStack{
            TabView(selection: $defaultTag){
                Solar_System()
                    .tabItem {
                        Label("Solar System", systemImage: "sun.min")
                    }
                    .tag("solar")
                
                Planets()
                    .tabItem {
                        Label("Planets",systemImage: "star")
                    }
                    .tag("stars")
                
                Earth()
                    .tabItem {
                        Label("Earth & Moon",systemImage: "globe.americas")
                    }
                    .tag("earth")
                
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
