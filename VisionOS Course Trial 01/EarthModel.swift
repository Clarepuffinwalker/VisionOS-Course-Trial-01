//
//  EarthModel.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit

struct EarthModel: View {
    var body: some View {
        
        RealityView{ content in
            guard let earth = try? await Entity(named: "Earth")
            else {
                print("Model not loaded.")
                return
            }
            earth.position = [-0.2,0,0]
            content.add(earth)
        }
    }
}

#Preview {
    EarthModel()
}
