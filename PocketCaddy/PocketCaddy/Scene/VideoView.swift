//
//  VideoView.swift
//  PocketCaddy
//
//  Created by Noah's Ark on 2022/06/16.
//

import SwiftUI

struct VideoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            // Background color setting
            Color.backgroundWhite
                .ignoresSafeArea()
            
            // View body section
            VStack {
                CustomBackButton(presentationMode: presentationMode)
                
                VStack {
                    // Sample image
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 300, height: 500)
                    
                    // Swting Tutorial Section
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundColor(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("💡 이렇게 사용해보세요!")
                                    .foregroundColor(.primaryGreen)
                                    .font(.system(size: Screen.width * 0.05, weight: .bold))
                                
                                Text("클럽의 헤드가 머리보다 앞에서 친다는 느낌으로 스윙하기")
                            }
                            .padding(.leading)
                            
                            Spacer()
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    
                    // Minimal height setting in order to make the swting tutorial section small
                    Spacer()
                        .frame(minHeight: 15)
                }
                
            }// VStack for CustomBackButton
        }// ZStack
    }// body
}// VideoView

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
