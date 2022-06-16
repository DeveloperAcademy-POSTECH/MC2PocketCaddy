//
//  HomeView.swift
//  PocketCaddie
//
//  Created by Byeon jinha on 2022/06/11.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack{
            Spacer()
            Text("\(Text("나와 맞는 골프채").foregroundColor(.primaryGreen))를\n찾아보세요")
                .font(.system(size: Screen.width * 0.09, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, Screen.width * 0.005)
            NavigationLink(destination: SearchView().navigationBarHidden(true)){
                NavigationButton(image: "AllClubBtn")
                    .frame(width: Screen.width * 0.85, height: Screen.height/5)            }
            NavigationLink(destination: SelectionView().navigationBarHidden(true)){
                NavigationButton(image: "LocationAndDistanceBtn")
            }.frame(width: Screen.width * 0.85, height: Screen.height/5)
            ZStack{
                SpeechBubble()
                    .frame(width: Screen.width*0.7, height: Screen.height/6)
                    .foregroundColor(.backgroundWhite)
                    .overlay {
                        SpeechBubble()
                            .stroke(Color.backgroundWhite, lineWidth: 1)
                    }
                   
                VStack (alignment: .leading) {
                    Text("💡알고계셨나요?")
                        .font(.system(size: 20, weight: .heavy))
                    Text(HomeViewTip[Int.random(in: 0..<HomeViewTip.count)])
                        .font(.system(size: 15))
                        .frame(width: Screen.width*0.6, height: Screen.height * 0.1)
                }
            }
            .padding(.horizontal, Screen.width * 0.2)
            Spacer()
            
        }
        .padding()// VStack
        .navigationBarHidden(true)
       
    } // body
} // HomeView

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK: Navigation button with asset image
struct NavigationButton: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .padding()
    }
}
