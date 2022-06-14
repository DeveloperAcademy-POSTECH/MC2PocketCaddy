//
//  ContentView.swift
//  Scene
//
//  Created by Balaji on 01/08/20.
//

import SwiftUI
import SceneKit

struct SceneKitView: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    var body: some View {
        Home()
        ZStack {
        BottomSheetView(isOpen: .constant(false), maxHeight: UIScreen.main.bounds.height*3/7) {
            VStack(alignment: .leading, spacing: 15, content: {
                Text(clubDataManager.selectedClub[0]!.name)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Spacer()
                Text(clubDataManager.selectedClub[0]!.description)
                HStack{
                    Text("Catecory")
                        .padding(.trailing,UIScreen.main.bounds.width/4)
                    Text(String(clubDataManager.selectedClub[0]!.distance!))
                        .padding(.leading,UIScreen.main.bounds.width/4)
                }
                HStack{
                    Text("Location")
                        .padding(.trailing,UIScreen.main.bounds.width/4)
                    Text(String(clubDataManager.selectedClub[0]!.distance!))
                        .padding(.leading,UIScreen.main.bounds.width/4)
                }
                HStack{
                    Text("Distance")
                        .padding(.trailing,UIScreen.main.bounds.width/4)
                    Text(String(clubDataManager.selectedClub[0]!.distance!))
                        .padding(.leading,UIScreen.main.bounds.width/4)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            })
            .padding(.horizontal)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct Home : View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    var body: some View{
        VStack{
            SceneView(scene: SCNScene(named: clubDataManager.models[clubDataManager.index].modelName), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
            Spacer(minLength: 0)
        }
    }
}

