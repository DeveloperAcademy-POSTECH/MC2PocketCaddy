//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//

import SwiftUI
import SpriteKit
struct LaunchView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
 
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView()){
                ZStack{
                    Rectangle().foregroundColor(.clear)
                    SpriteView(scene: scene)
                        .frame(width:screenWidth, height:screenHeight)
                        .ignoresSafeArea()

                    Text("POCKET\nCADDY").font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}
