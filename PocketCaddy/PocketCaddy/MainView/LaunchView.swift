//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//
import SpriteKit
import SwiftUI

struct LaunchView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @State var value: Int = 0
    @State var goToHomeView = false

    var scene: SKScene {
        let scene = LaunchScene()
        scene.size = CGSize(width: screenWidth, height: screenHeight)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView(), isActive: $goToHomeView){
                ZStack{
                    SpriteView(scene: scene)
                        .frame(width:screenWidth, height:screenHeight)
                        .ignoresSafeArea()
                    Text("POCKET\nCADDIE").font(.system(size: 40))
                        .foregroundColor(.white)
                        .bold()
                }
            }.onAppear(){
                timeCount()
            }
        }
    }
    
    func timeCount() {
       Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {  timer in
           self.value += 1
           print(self.value)
           if self.value == 4 {
               self.goToHomeView = true
               return
           }
           
       }
   }
}
