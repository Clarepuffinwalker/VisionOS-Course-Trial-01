//
//  Immersive Earth.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/30.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Immersive_Earth: View {
    
    @State private var earthSkybox: ModelEntity = ModelEntity()
    
    var body: some View {
        RealityView { content in
            
            //skyboxEarth
            guard let resource = try? await TextureResource(named: "BellerbyCoWorldPrussianBlue") else {
                print("Unable to load texture")
                return
            }
            var SkyboxOrignalMaterial = UnlitMaterial()
            SkyboxOrignalMaterial.color = .init(texture: .init(resource))
            
            earthSkybox = ModelEntity(mesh: .generateSphere(radius: 500.0), materials: [SkyboxOrignalMaterial])
            
            earthSkybox.scale = .init(x: -1 * abs(earthSkybox.scale.x),y:earthSkybox.scale.y, z:earthSkybox.scale.z )
            
            //rotate
            earthSkybox.components.set(InputTargetComponent(allowedInputTypes: [.indirect,.direct]))
            earthSkybox.collision = CollisionComponent(shapes: [.generateSphere(radius: 0.5)])
            earthSkybox.components.set(HoverEffectComponent())
            content.add(earthSkybox)
        }
        .gesture(
            DragGesture()
                .targetedToEntity(earthSkybox)
                .onChanged{ value in
                    earthSkybox.position = value.convert(value.location3D, from: .local, to: earthSkybox.parent!)
                }
            )
        .simultaneousGesture(
            RotateGesture3D()
            .targetedToEntity(earthSkybox)
            .onChanged{ value in
                let quatd = value.rotation.quaternion
                let quatf = simd_quatf(ix:Float(quatd.imag.x),iy:Float(quatd.imag.y),iz:Float(quatd.imag.z),r: Float(quatd.real))
                earthSkybox.transform.rotation = quatf
            }
        )
    }
}

#Preview {
    Immersive_Earth()
}
