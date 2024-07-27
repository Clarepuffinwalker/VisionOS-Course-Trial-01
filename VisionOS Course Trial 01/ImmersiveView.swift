//
//  ImmersiveView.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        HStack{
            Text("Placeholder")
        }
        /*
        RealityView { content in
            // Add the initial RealityKit content
            if let model = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(model)
            }
        }*/
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
