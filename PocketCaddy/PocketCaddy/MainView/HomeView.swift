//
//  HomeView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("어떤 방법")
                        .foregroundColor(.secondaryGreen)
                    Text("으로")
                }
                Text("채를 확인하실건가요?")
            }.font(.system(size: 35).bold())
            
            Spacer()
            
            NavigationLink(destination: LaunchView()){
                Image("AllClubBtn").padding()
            }
            
            NavigationLink(destination: SearchView()){
                Image("LocationAndDistanceBtn").padding()
            }
            //Image 사이즈 수정 필요함
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.grayBackground)
                    .frame(width: 330 , height: 60)
                    .overlay(
                        HStack{
                            Image("Tip")
                                .padding()
                            Text("asfdtyguhlioj;hlugkjfdjklfghjkljhgfdghjkljhgfdghjkldf")
                                .padding()
                        })
                    .padding()
            }
            Spacer()
        } //ZStack
        .navigationBarHidden(true)
    } //  body
} // HomeView

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
