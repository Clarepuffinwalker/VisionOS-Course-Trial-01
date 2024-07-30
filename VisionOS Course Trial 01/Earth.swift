//
//  Earth.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit

struct Earth: View {
    
    @State private var showEarthMoonVolume = false
    @State private var showImmersiveEarth = false
    @State private var immersiveEarthIsShown = false
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        VStack{
            
            Text("地球与月球")
                .font(.extraLargeTitle2)
                .padding(.bottom,50)
            
            Text("""
            地球（英文名：Earth；拉丁文：Terra）是距离太阳1.5亿公里的第三颗行星，也是人类已知的唯一孕育和支持生命的天体。地球的表面大约 29.2% 是由大陆和岛屿组成的陆地，剩余的 70.8% 大部分被海洋、海湾和其他咸水体覆盖，也被湖泊、冰川、河流和其他淡水体覆盖，尤其冰川覆盖最多,它们共同构成了水圈。地球的大部分极地地区都被冰覆盖。地球外层分为几个刚性构造板块，它们在数百万年的时间里在地表迁移，而其内部仍然保持活跃。
            地球的大气主要由氮和氧组成。热带地区接收的太阳能多于极地地区，并通过大气和海洋环流重新分配。温室气体在调节地表温度方面也发挥着重要作用。一个地区的气候不仅由纬度决定，还由海拔和与该地区和海洋的接近程度等因素决定。热带气旋、雷暴、热浪等恶劣天气多发于广大地区，对生活影响较大。
            月球是太阳系中体积第五大的卫星，其平均半径约为1737.10千米，相当于地球半径的0.273倍；质量则接近7.342×10²²千克，相当于地球的0.0123倍 [1]。月球的表面布满了可能由小天体撞击形成的撞击坑。月球与地球的平均距离约38.44万千米，大约是地球直径的30倍。
            月球具有与地球相似的流体外核和固体内核。
            """)
            .font(.callout)
            .frame(width:1000, height:200)
            .padding(.bottom,50)
            
            
            HStack{
                //Toggle01
                Toggle("Show Earth & Moon", isOn: $showEarthMoonVolume)
                    .font(.title)
                    .onChange(of:showEarthMoonVolume){_,newValue in
                        if newValue {
                            openWindow(id:"earthMoonModel")
                        }
                        else {
                            dismissWindow(id:"earthMoonModel")
                        }
                    }
                    .toggleStyle(.button)
                    .padding(.trailing,50)
                
                //Toggle02
                Toggle("Get Into Earth (rotatable)", isOn: $showImmersiveEarth)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .toggleStyle(.button)
            }
            .padding(.bottom,50)
            .onChange(of: showImmersiveEarth) { _, newValue in
                Task {
                    if newValue {
                        switch await openImmersiveSpace(id: "ImmersiveEarth") {
                        case .opened:
                            immersiveEarthIsShown = true
                        case .error, .userCancelled:
                            fallthrough
                        @unknown default:
                            immersiveEarthIsShown = false
                            showImmersiveEarth = false
                        }
                    } else if immersiveEarthIsShown {
                        await dismissImmersiveSpace()
                        immersiveEarthIsShown = false
                    }
                }
            }
            
        }
    }
}

#Preview {
    Earth()
}
