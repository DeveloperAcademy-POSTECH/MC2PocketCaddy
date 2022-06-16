//
//  LaunchView.swift
//  PocketCaddie
//
//  Created by Byeon jinha, Minyoung Kim on 2022/06/10.
//

import SpriteKit
import SwiftUI

struct LaunchView: View {
    @State var value: Int = 0
    @State var goToHomeView: Bool = false
    
    var scene: SKScene {
        let scene: LaunchScene = LaunchScene()
        
        scene.size = CGSize(width: Screen.width, height: Screen.height)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: HomeSelection(),
                isActive: $goToHomeView
            ) {
                ZStack{
                    SpriteView(scene: scene)
                        .frame(width:Screen.width , height:Screen.height)
                        .ignoresSafeArea()
                    
                    Text("POCKET\nCADDIE")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.white)
                    
                }
            }
            .onAppear(){
                timeCount()
            }
        }
    }
    
    func timeCount() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.value += 1
            
            if self.value == 4 {
                self.goToHomeView = true
                
                return
            }
        }
    }
    
} // LaunchView

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
