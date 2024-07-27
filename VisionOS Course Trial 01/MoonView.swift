//
//  MoonView.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit

struct MoonView: View {
    var body: some View {
        
        RealityView{ content in
            
            guard let moon = try? await Entity(named: "Moon")
            else {
                print("Model not loaded.")
                return
            }
            moon.position = [0.2,0,0]
            content.add(moon)
        }
        
    }
}

#Preview {
    MoonView()
}
