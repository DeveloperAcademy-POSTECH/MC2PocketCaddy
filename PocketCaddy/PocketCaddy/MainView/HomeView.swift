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
            Spacer()
            
            VStack(alignment: .leading){
                HStack{
                    Text("어떤 방법")
                        .foregroundColor(.secondaryGreen)
                    Text("으로")
                }
                Text("채를 확인하실건가요?")
            }.font(.system(size: 35).bold())
            
            Spacer()
            
            NavigationLink(destination: SelectionView()){
                Image("AllClubBtn")
                    .resizable()
                    .padding()
            }
            
            NavigationLink(destination: SearchView()){
                Image("LocationAndDistanceBtn")
                    .resizable()
                    .padding()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.backgroundWhite)
                    .frame(height: UIScreen.main.bounds.height/12).padding()
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
