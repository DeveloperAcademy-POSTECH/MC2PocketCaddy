//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var clubDataManager : ClubDataManager
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let cutBackgroundHeight = UIScreen.main.bounds.height * 0.6
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
                    HStack {
                        Button {

                        } label: {
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .foregroundColor(.greenForeground)
                        }.frame(width: buttonWidth, height: buttonWidth)
                        .padding([.top, .leading])
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
// MARK: Text UI
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text("1-Wood")
                            .bold()
                            .font(.system(size: 40))
                            .foregroundColor(.greenForeground)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text("드라이버는 클럽의 헤드가 머리보다\n앞에서 친다는 느낌으로 스윙하기")
                            .font(.system(size: 16))
                            .foregroundColor(.greenForeground)
                    }.frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    
// MARK: Image UI
                    HStack{
                        Image("RoundDriverButton")
                            .padding([.leading, .bottom], 40.0)
                            .frame(maxHeight:.infinity, alignment: .bottom)
                        
                        Spacer()
                        
                        Image("TestClub")
                            .padding(.trailing)
                            .frame(maxHeight:.infinity, alignment: .bottom)
                    }
                }.frame(width: screenWidth, height: cutBackgroundHeight, alignment: .top)
                
// MARK: Specification UI
                VStack(spacing: 20) {
                    HStack {
                        Image.category
                        
                        Spacer()
                        
                        Text("Wood")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)
     
                    HStack {
                        Image.location
                        
                        Spacer()
                        
                        Text("Teeing Ground")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)

                    HStack {
                        Image.distance
                        
                        Spacer()
                        
                        Text("200m")
                            .foregroundColor(.white)
                    }.frame(width: specWidth)
                }.frame(width: screenWidth, height: specHeight)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

extension Image {
    static let cutBackground = Image("CutBackground")
    static let category = Image("Category")
    static let location = Image("Location")
    static let distance = Image("Distance")
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
