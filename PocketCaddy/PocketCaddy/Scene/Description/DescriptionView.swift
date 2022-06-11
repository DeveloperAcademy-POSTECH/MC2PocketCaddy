//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var clubDataManager : ClubDataManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let cutBackgroundHeight = UIScreen.main.bounds.height * 0.7
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let specHeight = UIScreen.main.bounds.height * 0.3
    let specWidth = UIScreen.main.bounds.width * 0.7
    
    var body: some View {
        ZStack {
            Color.greenBackground
            
// MARK: CutBackground Image
            VStack {
                Image.cutBackground
                    .resizable()
                    .frame(width: screenWidth, height: cutBackgroundHeight, alignment: .center)

                Spacer()
            }
            
            VStack(alignment: .leading) {
// MARK: Backward Button
                VStack {
                    Spacer()
                        .frame(height: screenHeight * 0.05)
                    
                    HStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .foregroundColor(.greenForeground)
                        }.frame(width: buttonWidth, height: buttonWidth)
                        .padding([.top, .leading])
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
// MARK: Text UI
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text(".selectedClub")
                            .bold()
                            .font(.system(size: 40))
                            .foregroundColor(.greenForeground)
                        
                        Image("CategoryDriver")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text("clubDataManager.selectedClub.description")
                            .font(.system(size: 16))
                            .foregroundColor(.greenForeground)
                    }.frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    
// MARK: Image UI
                    HStack{
                        Image.arButton
                            .padding(40.0)
                            .frame(maxHeight:.infinity, alignment: .bottom)
                        
                        Spacer()
                        
                        Image("TestClub")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.top, .leading, .trailing])
                            .frame(maxHeight:.infinity, alignment: .bottom)
                    }
                }.frame(width: screenWidth, height: cutBackgroundHeight, alignment: .top)
                .clipped()
                
// MARK: Specification UI
                VStack(spacing: 20) {
                    HStack {
                        Image.category
                        
                        Spacer()
                        
                        Text(".category")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)
     
                    HStack {
                        Image.location
                        
                        Spacer()
                        
                        Text(".location")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)

                    HStack {
                        Image.distance

                        Spacer()
                        
                        Text((".distance") + "m")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)
                }.frame(width: screenWidth, height: specHeight)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
        DescriptionView()
    }
}
