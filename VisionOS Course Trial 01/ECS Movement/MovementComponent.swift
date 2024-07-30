//
//  MovementComponent.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/30.
//

import Foundation
import RealityKit

//define Component
public struct MoveComponent: Component{
    public var speed: Float = 1.0
    public var radius: Float = 0.2
    public var angle: Float = 0.0
    
    public var center: SIMD3<Float>
    
    public init(position: SIMD3<Float>){
        center = [position.x, position.y,position.z]
    }
}
