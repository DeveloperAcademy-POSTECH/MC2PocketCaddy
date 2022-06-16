//
//  HomeView.swift
//  PocketCaddie
//
//  Created by Byeon jinha on 2022/06/11.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isAllClubActive: Bool
    @Binding var isLocationAndDistanceActive: Bool

    var body: some View {
        VStack{
            VStack {
                HStack {
                    Text("\(Text("어떤 방법").foregroundColor(.secondaryGreen))으로\n채를 확인하실건가요?")
                        .font(.system(size: 35).bold())
                        .padding()
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.isAllClubActive = true
                    }
                }) {
                    NavigationButton(image: "AllClubBtn")
                }
                
                Button(action: {
                    withAnimation {
                        self.isLocationAndDistanceActive = true
                    }
                }) {
                    NavigationButton(image: "LocationAndDistanceBtn")
                }
                
//                NavigationLink(destination: SearchView().navigationBarHidden(true)) {}
//                NavigationLink(destination: SelectionView().navigationBarHidden(true)) {}
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.backgroundWhite)
                        .padding()
                    
                    VStack (alignment: .leading) {
                        Image("Tip")
                        
                        Text(HomeViewTip[Int.random(in: 0..<HomeViewTip.count)])
                    }
                    .padding()
                }
                
                Spacer()
                
            }
            .navigationBarHidden(true)
        } // body
    } // HomeView
    
//    struct HomeView_Previews: PreviewProvider {
//        static var previews: some View {
//            HomeView(isAllClubActive: <#T##Binding<Bool>#>, isLocationAndDistanceActive: <#T##Binding<Bool>#>)
//        }
//    }
    
    // MARK: Navigation button with asset image
    struct NavigationButton: View {
        let image: String
        
        var body: some View {
            Image(image)
                .resizable()
                .padding()
        }
    }
}
