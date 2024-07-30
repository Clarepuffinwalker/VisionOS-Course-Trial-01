//
//  VisionOS_Course_Trial_01App.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI

@main
struct VisionOS_Course_Trial_01App: App {
    
    //register custom ECS System
    init(){
        MoveComponent.registerComponent()
        MoveSystem.registerSystem()
    }
    
    @State private var currentImmersionStyle: ImmersionStyle = .progressive
    @State private var currentEarthImmersion: ImmersionStyle = .progressive
    
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
        
        WindowGroup(id:"earthMoonModel")  {
            Earth_Moon_Model()
        }
        .windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
        .immersionStyle(selection: $currentImmersionStyle, in: .mixed,.progressive,.full)
        
        ImmersiveSpace(id: "ImmersiveEarth") {
            Immersive_Earth()
        }
        .immersionStyle(selection: $currentEarthImmersion, in: .mixed,.progressive,.full)
    }
}
