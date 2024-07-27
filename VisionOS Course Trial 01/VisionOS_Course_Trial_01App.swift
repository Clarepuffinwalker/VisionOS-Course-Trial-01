//
//  VisionOS_Course_Trial_01App.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI

@main
struct VisionOS_Course_Trial_01App: App {
    var body: some Scene {
        WindowGroup(id:"tab") {
            ContentView()
        }
        .defaultSize(width: 1280, height: 720)
        
        WindowGroup(id:"solar")  {
            Solar_System()
        }
        
        WindowGroup(id:"planets")  {
            Planets()
        }
        
        WindowGroup(id:"earth")  {
            Earth()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
