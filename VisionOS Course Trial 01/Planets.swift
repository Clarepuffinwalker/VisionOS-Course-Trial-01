//
//  Planets.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit

struct Planets: View {
    
    var planets: [Planets_Info] = []
    @State var selectedPlanet: Planets_Info?
    
    var body: some View {
        
            NavigationSplitView{
                List(planets,selection: $selectedPlanet){
                    apple in
                    NavigationLink(apple.name, value: apple)
                }
                .navigationTitle("Planets")
                .font(.title2)
                
            } detail:{
                if let selectedPlanet = selectedPlanet{
                    //detailViews
                    Planets_Detail_View(planet:selectedPlanet)
                } else {
                    VStack(alignment: .center){
                        Text("""
Text
""")
                        .padding(.bottom,30)
                        
                        Text("Please select a planet first")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width:800,height:500)
                }
            }
        }
        
        //init settings of using static set info in Planets_info
        init(){
            planets = Planets_Info.info
        }

}

#Preview {
    Planets()
}
