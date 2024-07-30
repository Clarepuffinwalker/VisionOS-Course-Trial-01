//
//  ImmersiveViewArchive.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/30.
//

import SwiftUI
import RealityKit
import RealityKitContent

/*
 struct ImmersiveViewArchive: View {
 
 private let radius: Float = 0.2
 @State var programmaticEntity = Entity()
 
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
 guard let earth = try? await Entity(named: "Earth")
 else {
 print("Model not loaded.")
 return
 }
 earth.position = [-0.2,0,0]
 content.add(earth)
 earth.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
 earth.components.set(ImageBasedLightReceiverComponent(imageBasedLight: earth))
 
 //Moon (rotate around earth)
 guard let moon = try? await Entity(named: "Moon")
 else {
 print("Model not loaded.")
 return
 }
 
 //moon move
 let initPosition = SIMD3<Float>(x:0.5,y:0,z:0)
 var moveComponent = MoveComponent(position: initPosition)
 programmaticEntity = moon
 
 programmaticEntity.position = initPosition
 programmaticEntity.components[MoveComponent.self] = moveComponent
 content.add(programmaticEntity)
 
 
 //add moon
 content.add(moon)
 moon.components.set(ImageBasedLightComponent(source:.single(environment), intensityExponent: 2.0))
 moon.components.set(ImageBasedLightReceiverComponent(imageBasedLight: moon))
 
 
 }
 }
 }
 
 
 #Preview {
 ImmersiveViewArchive()
 }
 */
