//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/10.
//

import SwiftUI

struct LaunchView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var body: some View {
        NavigationView{
            NavigationLink(destination: HomeView()){
                ZStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .ignoresSafeArea()
//                    GifImage("flag")
//                        .frame(width: 610, height: 1000)
                }
            }
        }
    }
}
