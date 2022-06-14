//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//
import Combine
import Foundation
import SpriteKit
import SwiftUI

class MyTimer: ObservableObject {
   @Published var value: Int = 0
   @Published var goToHomeView = false
   init() {
       Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {  timer in
           self.value += 1
           if self.value == 9999 {
               self.goToHomeView = true
           }
       }
   }
}

struct LaunchView: View {
    @ObservedObject var myTimer = MyTimer()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var scene: SKScene {
        let scene = LaunchScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView(), isActive: $myTimer.goToHomeView){
                ZStack{
                    SpriteView(scene: scene)
                        .frame(width:screenWidth, height:screenHeight)
                        .ignoresSafeArea()
                    Text("POCKET\nCADDIE").font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}
