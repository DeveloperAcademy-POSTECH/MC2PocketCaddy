//
//  DescriptionSingleView.swift
//  PocketCaddy
//
//  Created by Hyeon-sang Lee on 2022/06/16.
//

import SwiftUI

struct DescriptionSingleView: View {
    @State var selectedClub: ClubModel?
    @State var isPressed = false
    @Binding var isViewActive: Bool
    
    @GestureState var longPressTap = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let specHeight = UIScreen.main.bounds.height * 0.3
    let specWidth = UIScreen.main.bounds.width * 0.7
    
    var body: some View {
        if let selectedClub = selectedClub {
            ZStack {
                Color.backgroundWhite
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                        .frame(height: screenHeight * 0.1)
                    
                    Text(selectedClub.category.rawValue)
                        .foregroundColor(.primaryGreen.opacity(0.5))
                        .font(.system(size: 170))
                        .fontWeight(.heavy)
                        .frame(width: Screen.width * 2, alignment: .center)
                    
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 0) {
                    CustomBackButtonGoBack()
                        .transition(.opacity)
                        .opacity(longPressTap ? 0.4 : 1.0)
                        .gesture(
                            LongPressGesture(minimumDuration: 1000000)
                                .updating($longPressTap, body: { (currentState, state, transaction) in
                                    state = currentState
                                })
                        )
                        .simultaneousGesture(TapGesture()
                            .onEnded { _ in
                                self.isViewActive.toggle()
                            })
//                        .onTapGesture {
//                            withAnimation {
//                                self.isViewActive.toggle()
//                            }
//                        }

                    
                    Spacer()
                        .frame(height: screenHeight * 0.02)
                    
                    HStack(alignment: .center) {
                        Image(selectedClub.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: screenWidth ,height: screenHeight * 0.35)
    //                .overlay {
    //                    Image.arButton
    //                        .resizable()
    //                        .frame(width: screenWidth * 0.2, height: screenWidth * 0.2)
    //                        .offset(x: screenWidth * (-0.3), y: screenHeight * 0.1)
    //                }
                        
                    ZStack{
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundColor(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.gray, lineWidth: 0.5)
                            }
                        
                        VStack(spacing: 10) {
                            Spacer()
                            
                            HStack{
                                Text(selectedClub.name)
                                    .foregroundColor(.primaryGreen)
                                    .font(.system(size: 40, weight: .bold))
                              
                                ZStack{
                                    Text("  " + selectedClub.subName + "  ")
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Capsule()
                                        .foregroundColor(.primaryGreen)
                                    
                                    Text(selectedClub.subName)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                }.frame(height: 30)
                                .fixedSize()
                            }.frame(width: specWidth, alignment: .leading)

                            HStack{
                                GeometryReader{ g in
                                    Text(selectedClub.description)
                                        .foregroundColor(.primaryGreen)
                                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.25 :  g.size.height * 0.25))
                                }
                            }.frame(width: specWidth, alignment: .leading)
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                    .frame(width: screenWidth * 0.05)
                                
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: screenWidth * 0.2, height: 1)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "bookmark.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                                
                                Text("Category")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))

                                Spacer()

                                Text(selectedClub.category.rawValue)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .bold))
                            }.frame(width: specWidth)

                            HStack {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))

                                Text("Location")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))

                                Spacer()

                                Text(selectedClub.location.rawValue)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .bold))
                            }.frame(width: specWidth)

                            HStack {
                                Image(systemName: "arrow.left.arrow.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))

                                Text("Distance")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                switch selectedClub.distance?.description {
                                case nil:
                                    Text("홀까지 거리를 조정해요")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .bold))
                                default:
                                    Text((selectedClub.distance?.description ?? "_") + " m")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16, weight: .bold))
                                }
                            }.frame(width: specWidth)
                            
                            Spacer()
                        }.foregroundColor(.backgroundWhite)
                        .padding()
                    }.frame(width: screenWidth * 0.9, height: screenHeight * 0.4, alignment: .center)
                    
                    Spacer()
                }.frame(width: screenWidth)
            }.navigationBarHidden(true)
        } else {
            EmptyView()
                .navigationBarHidden(true)
        }
    }
}
