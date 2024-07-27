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
八大行星（8 Planets），是指太阳系的八个大行星，按照离太阳的距离从近到远，它们依次为水星（☿）、金星（♀）、地球（⊕）、火星（♂）、木星（♃）、土星（♄）、天王星（♅）、海王星（♆ [1]）。八大行星自转方向多数也和公转方向一致。只有金星和天王星两个例外。金星自转方向与公转方向相反，天王星则是与公转轨道呈97°角的“躺着”旋转。
行星的定义：一是必须围绕恒星运转的天体；二是质量足够大，能依靠自身引力使天体呈圆球状；三是这个轨道附近应该没有其他物体（清理其轨道上的其它物体）。按这样的划分，太阳系的行星就只有水星、金星、地球、火星、木星、土星、天王星、海王星这八颗。 [2]
与2006年之前提到的九大行星概念不同，在2006年8月24日于布拉格举行的第26届国际天文学联会中通过的第5号决议中，冥王星（Pluto）被划为矮行星，除名于八大行星之外。
""")
                        .padding(.bottom,30)
                        
                        Text("Please select a planet first")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width:800, height:500)
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
