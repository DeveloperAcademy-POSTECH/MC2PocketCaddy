//
//  CustomBackButton.swift
//  PocketCaddy
//
//  Created by Noah's Ark on 2022/06/15.
//

import SwiftUI

struct CustomBackButton: View {
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .foregroundColor(.primaryGreen)
            }
            .frame(width: Screen.height * 0.03 , height: Screen.height * 0.025)
            .padding(.leading, 25)
            .padding(.vertical, 10)
            
            Spacer()
        }// HStack
        
    }// body
}// CustomBackButton

struct CustomBackButtonGoBack: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    @Binding var isViewActive: Bool
    @GestureState var longPressTap = false
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
                .resizable()
                .foregroundColor(.primaryGreen)
                .frame(width: Screen.height * 0.03 , height: Screen.height * 0.025)
                .padding(.leading, 25)
                .padding(.vertical, 10)
            
            Spacer()
        }// HStack
        .opacity(longPressTap ? 0.4 : 1.0)
        .onTapGesture {
            clubDataManager.searchSelectedClub = nil
        }
        .gesture(
            LongPressGesture(minimumDuration: 1000000)
                .updating($longPressTap, body: { (currentState, state, transaction) in
                    state = currentState
                })
        )
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    withAnimation {
                        self.isViewActive.toggle()
                    }
                }
        )
    }// body
}// CustomBackButton

struct CustomBackButton2: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Button {
                clubDataManager.selectedAppearance = true
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .foregroundColor(.backgroundWhite)
            }.frame(width: Screen.height * 0.03 , height: Screen.height * 0.025)
                .padding([.top, .leading])
            Spacer()
        }
        
    }
}
