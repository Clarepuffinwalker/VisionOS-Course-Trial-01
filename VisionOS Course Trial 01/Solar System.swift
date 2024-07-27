//
//  Solar System.swift
//  VisionOS Course Trial 01
//
//  Created by Clare Zhou on 2024/7/26.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Solar_System: View {
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {

            Text("太阳系")
                .font(.extraLargeTitle2)
                .padding(.top,50)
            
            HStack{
                Text("""
            太阳系位于距银河系中心大约估计值为2.4~2.7万光年的位置（银河系的恒星数量约在1000亿到4000亿之间，太阳只是其中之一）。太阳以220千米/秒的速度绕银心运动，大约2.5亿年绕行一周，地球气候及整体自然界也因此发生2.5亿年的周期性变化。太阳运行的方向基本上是朝向织女座，靠近武仙座的方向。
            截至2019年10月，太阳系包括太阳、8个行星、近500个卫星和至少120万个小行星。还有一些矮行星和彗星。若以海王星轨道作为太阳系边界，则太阳系直径为60个天文单位，即约90亿千米。若以日球层为界，则太阳距太阳系边界可达100个天文单位（最薄处）。若以奥尔特云为界，则太阳系直径可能有20万天文单位。
            太阳系的形成大约始于46亿年前一个巨型星际分子云的引力坍缩。太阳系内大部分的质量都集中于太阳，余下的天体中，质量最大的是木星。八大行星逆时针围绕太阳公转。此外还有较小的天体位于木星与火星之间的小行星带。柯伊伯带和奥尔特云也存在大量的小天体。还有很多卫星绕转在行星或者小天体周围。小行星带外侧的每颗行星都有行星环。
            2023年，法国国家科学研究中心等机构的科学家发现了太阳系中可能普遍存在的极光机制。
            """)
                .font(.callout)
                .frame(width:650, height:300)
                .padding(.leading,100)
                
                RealityView{ content in
                    
                    guard let sun = try? await Entity(named: "Sun")
                    else {
                        print("Model not loaded.")
                        return
                    }
                    sun.position = [0,0,-0.2]
                    content.add(sun)
                }
            }

            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
        }
        .padding(.bottom,50)
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    Solar_System()
}
