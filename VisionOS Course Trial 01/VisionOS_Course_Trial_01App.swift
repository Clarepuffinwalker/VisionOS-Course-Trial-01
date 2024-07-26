//
//  VisionOS_Course_Trial_01App.swift
//  VisionOS Course Trial 01
//
//  Created by 周铁 on 2024/7/26.
//

import SwiftUI

@main
struct VisionOS_Course_Trial_01App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
