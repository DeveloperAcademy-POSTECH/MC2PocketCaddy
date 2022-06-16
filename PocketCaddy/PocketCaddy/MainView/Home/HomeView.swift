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
                Spacer()
                
                Text("\(Text("나와 맞는 골프채").foregroundColor(.primaryGreen))를\n찾아보세요")
                    .font(.system(size: Screen.width * 0.09, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                
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
                
                Spacer()
                
                // 🔥
                ZStack{
                    SpeechBubble()
                        .frame(width: Screen.width * 0.8, height: Screen.height * 0.15)
                        .foregroundColor(.backgroundWhite)
                        .padding()
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Spacer()
                        
                        HStack{
                            Text("💡알고계셨나요?")
                                .font(.system(size: Screen.width * 0.05, weight: .bold))
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text(HomeViewTip[Int.random(in: 0..<HomeViewTip.count)])
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .frame(width: Screen.width * 0.75, height: Screen.height * 0.2)

                }
                
                Spacer()
                
                // 🔥
                
            }
            .padding()// VStack
            .navigationBarHidden(true)
            
            
        } // body
    } // HomeView
    
    // MARK: Navigation button with asset image
    struct NavigationButton: View {
        let image: String
        
        var body: some View {
            Image(image)
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fill)
                .frame(width: Screen.width * 0.9, height: Screen.height * 0.2)
        }
    }
}
