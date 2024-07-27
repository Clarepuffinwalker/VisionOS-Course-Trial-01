//
//  Planets_Detail_View.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import Foundation
import SwiftUI
import RealityKit

struct Planets_Detail_View: View {
    
    //@State var planet: Planets_Info
    var planet: Planets_Info
        //前面总NavigationSplit & Link 里的定义的单数
        //PlanetsView中var planets: [Planets_Info] = [] 单数
        //@State var selectedPlanet: Planets_Info?
        @State private var model: Entity?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(planet.id). \(planet.name)")
                Text("\(planet.description)")
                    .font(.body)
                    .padding()
                    .navigationTitle(planet.name)
            }
            .frame(width: 500, height: 1000)
            
            // Display model
            if let planetModel = planet.modelEntity {
                RealityView { content in
                    content.add(planetModel)
                    print("Model loaded successfully.")
                }
                // Use the planet id to force the view to update
                .id(planet.id)
            } else {
                Text("Model not loaded.")
                }
            }
        }
    
    //init settings of using static set info in Planets_info
    init(planet: Planets_Info) {
        self.planet = planet
    }
    
}

