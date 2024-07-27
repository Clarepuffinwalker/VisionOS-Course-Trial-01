//
//  Planets_Info.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import Foundation
import RealityKit

struct Planets_Info: Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var url: URL
    var modelEntity: Entity?
}

// Initialize the entities outside the struct definition
let mercuryEntity = try? Entity.load(named: "Mercury")
let venusEntity = try? Entity.load(named: "Venus")
let earthEntity = try? Entity.load(named: "Earth")
let marsEntity = try? Entity.load(named: "Mars")
let jupiterEntity = try? Entity.load(named: "Jupiter")
let saturnEntity = try? Entity.load(named: "Saturn")
let uranusEntity = try? Entity.load(named: "Uranus")
let neptuneEntity = try? Entity.load(named: "Neptune")

extension Planets_Info {
    static let info = [
        Planets_Info(id: 1, name: "Mercury", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: mercuryEntity),
        Planets_Info(id: 2, name: "Venus", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: venusEntity),
        Planets_Info(id: 3, name: "Earth", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: earthEntity),
        Planets_Info(id: 4, name: "Mars", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: marsEntity),
        Planets_Info(id: 5, name: "Jupiter", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: jupiterEntity),
        Planets_Info(id: 6, name: "Saturn", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: saturnEntity),
        Planets_Info(id: 7, name: "Uranus", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: uranusEntity),
        Planets_Info(id: 8, name: "Neptune", description: """
            Description text here.
        """, url: URL(string: "https://www.bing.com")!, modelEntity: neptuneEntity),
    ]
}
