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
        VStack {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("\(Text("나와 맞는 골프채").foregroundColor(.primaryGreen))를\n찾아보세요")
                    .font(.system(size: Screen.width * 0.09, weight: .bold))
                    .fixedSize(horizontal: true, vertical: true)
                    .padding([.top, .bottom], Screen.width * 0.12)
                    .padding(.leading, Screen.width * 0.02)
                
                
                Button(action: {
                    withAnimation {
                        self.isLocationAndDistanceActive = true
                    }
                }) {
                    NavigationButton(image: "LocationAndDistanceBtn")
                }
                
                Button(action: {
                    withAnimation {
                        self.isAllClubActive = true
                    }
                }) {
                    NavigationButton(image: "AllClubBtn")
                }
                
                Spacer()
                
                ZStack{
                    SpeechBubble()
                        .frame(width: Screen.width * 0.83, height: Screen.height * 0.115)
                        .foregroundColor(.backgroundWhite)
                        .padding()
                    
                    VStack (alignment: .leading, spacing: 12) {
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
                
            }// VStack
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
