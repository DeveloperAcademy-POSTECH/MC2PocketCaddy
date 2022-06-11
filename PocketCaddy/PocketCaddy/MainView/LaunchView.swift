//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//

import SwiftUI
import SpriteKit
struct LaunchView: View {
    var bird = SKSpriteNode(imageNamed: "제목_없는_아트워크 6-1(드래그함)")
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let flag = SKAction(named: "action")
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView()){
                ZStack{
<<<<<<< Updated upstream
                    Rectangle()
                        .foregroundColor(.red)
                        .ignoresSafeArea()
                    GifImage("flag")
                        .frame(width: 610, height: 1000)
=======
                    Button(action: {
                        GameScene.createFlag()
                    } ){
                        Rectangle().frame(width: 100, height: 100)
                    }
//                    Rectangle()
//                        .foregroundColor(.red)
//                        .ignoresSafeArea()
                   
//                    GifImage("flag")
//                        .frame(width: 610, height: 1000)
>>>>>>> Stashed changes
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}
