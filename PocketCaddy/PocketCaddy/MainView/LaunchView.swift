//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//

import SpriteKit
import SwiftUI

class MyTimer: ObservableObject {
   var value: Int = 0
   
   init() {
                                             //간격        //반복되기때문에 true   //timer을 in 해준다.
       Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
           self.value += 1
           
       }
   }
}

struct LaunchView: View {
    var myTimer = MyTimer()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var value: Int = 0

    var scene: SKScene {
        let scene = LaunchScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView()){
                ZStack{
                    SpriteView(scene: scene)
                        .frame(width:screenWidth, height:screenHeight)
                        .ignoresSafeArea()

                    Text("POCKET\nCADDIE").font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                    Text(String(myTimer.value))
                }
            }
        }
    }
}
