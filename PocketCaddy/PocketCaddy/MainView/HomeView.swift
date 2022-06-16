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
            
            Spacer()
            
            NavigationLink(destination: SearchView().navigationBarHidden(true)){
                NavigationButton(image: "AllClubBtn")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Screen.width * 0.9, height: Screen.height * 0.2)
            }
            
            NavigationLink(destination: SelectionView().navigationBarHidden(true)){
                NavigationButton(image: "LocationAndDistanceBtn")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Screen.width * 0.9, height: Screen.height * 0.2)
            }
            
            Spacer()
            
            ZStack{
                SpeechBubble()
                    .frame(width: Screen.width * 0.8, height: Screen.height * 0.15)
                    .foregroundColor(.backgroundWhite)
                    .overlay {
                        SpeechBubble()
                            .stroke(Color.backgroundWhite, lineWidth: 1)
                    }
                   
                VStack (alignment: .leading, spacing: 10) {
                    Spacer()

                    HStack{
                        Text("💡알고계셨나요?")
                            .font(.system(size: 18, weight: .bold))

                        Spacer()
                    }

                    HStack{
                        Text(HomeViewTip[Int.random(in: 0..<HomeViewTip.count)])
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }

                    Spacer()
                }.frame(width: Screen.width * 0.75, height: Screen.height * 0.2)
            }
            
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
