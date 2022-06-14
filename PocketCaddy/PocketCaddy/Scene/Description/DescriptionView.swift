//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI
import iPages

struct DescriptionPageView: View {
    @EnvironmentObject var clubDataManager : ClubDataManager
    @State var currentPage: Int = 1
    
    var body: some View {
        iPages(selection: $currentPage){
            ForEach(clubDataManager.selectedClub.indices) { i in
                //DescriptionView(selectedClub: clubDataManager.selectedClub[i])
            }
        }
    }
}

struct DescriptionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var selectedClub: ClubModel
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let specHeight = UIScreen.main.bounds.height * 0.3
    let specWidth = UIScreen.main.bounds.width * 0.7
    
    var body: some View {
        ZStack {
            Color.backgroundWhite
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                    .frame(height: screenHeight * 0.1)
                
                Text("Wood")
                    .foregroundColor(.primaryGreen.opacity(0.5))
                    .font(.system(size: 170))
                    .fontWeight(.heavy)
                    .frame(width: 465, alignment: .center)
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.primaryGreen)
                    }
                    .frame(width: buttonWidth, height: buttonWidth)
                    .padding([.top, .leading])
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: screenHeight * 0.02)
                
                HStack(alignment: .center) {
                    Image("TestClub")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: screenWidth ,height: screenHeight * 0.35)
                .overlay {
//                    Image.arButton
//                        .resizable()
//                        .frame(width: screenWidth * 0.2, height: screenWidth * 0.2)
//                        .offset(x: screenWidth * (-0.3), y: screenHeight * 0.1)
                }
                    
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
                            Text("1-Wood")
                                .foregroundColor(.primaryGreen)
                                .font(.system(size: 40, weight: .bold))
                            
                            Capsule()
                                .frame(width: screenWidth * 0.2, height: 30)
                                .foregroundColor(.primaryGreen)
                                .overlay {
                                    Text("Driver")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                }
                        }.frame(width: specWidth, alignment: .leading)
                        
                        
                        HStack {
                            Text("드라이버는 클럽의 헤드가 머리보다  앞에서 친다는 느낌으로 스윙하기")
                                .foregroundColor(.primaryGreen)
                        }.frame(width: specWidth, alignment: .leading)
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                                .frame(width: screenWidth * 0.1)
                            
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

                            Text(".category")
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

                            Text(".location")
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

                            Text((".distance") + "m")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .bold))
                        }.frame(width: specWidth)
                        
                        Spacer()
                    }.foregroundColor(.backgroundWhite)
                    .padding()
                }.frame(width: screenWidth * 0.9, height: screenHeight * 0.4, alignment: .center)
                
                Spacer()
            }.frame(width: screenWidth)
        }.navigationBarHidden(true)
    }
}

extension Image {
    static let cutBackground = Image("CutBackground")
    static let arButton = Image("ARButton")
    static let category = Image("Category")
    static let location = Image("Location")
    static let distance = Image("Distance")
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionPageView()
    }
}
