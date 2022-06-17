//
//  SwiftUIView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/17.
//

import SceneKit
import SwiftUI

struct SceneKitView: View {
    var body: some View {
        SceneKit3DModelView()
    }
}
struct SceneKit3DModelView : View {
    @State var models = [
        Model(id: 0, name: "Driver shot", modelName: "Golf Drive.dae", details: "Driver shot"),
        Model(id: 0, name: "Putt shot", modelName: "Golf Putt.dae", details: "Putt shot"),
        Model(id: 0, name: "Chip shot", modelName: "Golf Chip.dae", details: "Cip shot")
    ]
    @State var index = 0
    var body: some View{
        VStack{
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 3)
            ZStack{
                HStack{
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical,30)
            VStack(alignment: .leading, spacing: 15, content: {
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(models[index].details)
            })
            .padding(.horizontal)
            Spacer(minLength: 0)
        }
    }
}


struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}
