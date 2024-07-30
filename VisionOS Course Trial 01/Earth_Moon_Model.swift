//
//  Earth_Moon_Model.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/30.
//

import SwiftUI
import RealityKit

struct Earth_Moon_Model: View {
    
    @State var programmaticEntity = Entity()
    
    var body: some View {
        
        RealityView{ content in
            
            //Models & Light
            guard let earth = try? await Entity(named: "Earth")
            else {
                print("Model not loaded.")
                return
            }
            earth.position = [0,0,0]
            content.add(earth)
            
            //Moon (rotate around earth)
            guard let moon = try? await Entity(named: "Moon")
            else {
                print("Model not loaded.")
                return
            }
            moon.scale = [0.25,0.25,0.25]

            //moon move
            let initPosition = SIMD3<Float>(x:0,y:0,z:0)
            let moveComponent = MoveComponent(position: initPosition)
            programmaticEntity = moon
            
                programmaticEntity.position = initPosition
                programmaticEntity.components[MoveComponent.self] = moveComponent
                content.add(programmaticEntity)
            
        }
        
    }
}

#Preview {
    Earth_Moon_Model()
}
