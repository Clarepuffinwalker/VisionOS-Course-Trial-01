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
    
    @State private var skybox = Entity()
    
    var body: some View {
        RealityView { content in
            
            //skybox
            guard let resource = try? await TextureResource(named: "4KSpace") else {
                print("Unable to load texture")
                return
            }
            var SkyboxOrignalMaterial = UnlitMaterial()
            SkyboxOrignalMaterial.color = .init(texture: .init(resource))
            skybox.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000), materials: [SkyboxOrignalMaterial]))
            skybox.scale = .init(x: -1 * abs(skybox.scale.x),y:skybox.scale.y, z:skybox.scale.z )
            content.add(skybox)
            
            //IBL
            guard let environment = try?await EnvironmentResource(named:"4KSpace")
            else {
                print("Unable to find IBL image")
                return
        }
            
            //Models & Light
            //sun
            guard let sun = try? await Entity(named: "Sun")
            else {
                print("Sun not loaded.")
                return
            }
            sun.scale = [10,10,10]
            sun.position = [0,0,0]
            content.add(sun)
            
            //mercury
            guard let mercury = try? await Entity(named: "Mercury")
            else {
                print("Mercury not loaded.")
                return
            }
            mercury.scale = [0.5,0.5,0.5]
            mercury.position = [-1,0,-1]
            content.add(mercury)
            mercury.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
            mercury.components.set(ImageBasedLightReceiverComponent(imageBasedLight: mercury))
            
            //earth
            guard let earth = try? await Entity(named: "Earth")
            else {
                print("Earth not loaded.")
                return
            }
            earth.position = [-1.5,0,-1.5]
            content.add(earth)
            earth.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
            earth.components.set(ImageBasedLightReceiverComponent(imageBasedLight: earth))
            
            //jupiter
            guard let jupiter = try? await Entity(named: "Jupiter")
            else {
                print("Jupiter not loaded.")
                return
            }
            jupiter.scale = [5,5,5]
            jupiter.position = [-2.5,0,-2.5]
            content.add(jupiter)
            jupiter.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
            jupiter.components.set(ImageBasedLightReceiverComponent(imageBasedLight: jupiter))
            
            
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
