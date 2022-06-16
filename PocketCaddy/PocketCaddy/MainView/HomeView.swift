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
            Text("\(Text("어떤 방법").foregroundColor(.primaryGreen))으로\n채를 확인하실건가요?")
                .font(.system(size: Screen.width * 0.09, weight: .bold))
                .fixedSize(horizontal: true, vertical: true)
                .padding(.bottom, Screen.width * 0.005)

            Spacer()
            NavigationLink(destination: SearchView().navigationBarHidden(true)){
                NavigationButton(image: "AllClubBtn")
                    .frame(width: Screen.width, height: Screen.height/4)
            }
            NavigationLink(destination: SelectionView().navigationBarHidden(true)){
                NavigationButton(image: "LocationAndDistanceBtn")
                    .frame(width: Screen.width, height: Screen.height/4)
            }
            ZStack{
                SpeechBubble()
                    .frame(width: Screen.width*0.9, height: Screen.height/6)
                    .foregroundColor(.backgroundWhite)
                    .overlay {
                        SpeechBubble()
                            .stroke(Color.backgroundWhite, lineWidth: 1)
                    }
                   
                VStack (alignment: .leading) {
                    Image("Tip")
                    Text(HomeViewTip[Int.random(in: 0..<HomeViewTip.count)])
                        .frame(width: Screen.width*0.7, height: Screen.height * 0.08)
                }
            }
            .padding(.horizontal, Screen.width * 0.2)
            Spacer()
            
        } // VStack
//        .preferredColorScheme(.light)
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
