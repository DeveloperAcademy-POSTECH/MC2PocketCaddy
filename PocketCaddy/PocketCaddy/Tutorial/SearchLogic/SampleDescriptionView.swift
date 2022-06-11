//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//
//  Last Refactoring, Theodore, 11 June 2022

import SwiftUI

// ✅ TODO: Refactoring - searchResult

struct SampleDescriptionView: View {
    // Sample Club Data Manager Variables
    var clubDataManager = SampleClubDataManager()
    
    // Variables
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let cutBackgroundHeight = UIScreen.main.bounds.height * 0.6
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let specHeight = UIScreen.main.bounds.height * 0.3
    let specWidth = UIScreen.main.bounds.width * 0.7
    
    // Info from SelectionView
    let locationInfo: Location
    let distance: Int
    
    var body: some View {
        // ✅ This view handles search data and release its result
        let searchResult = clubDataManager.searchClub(location: locationInfo, selectedDistance: distance)
        
        ZStack {
            Color.greenBackground
            
            // 🔥 CutBackground Image
            VStack {
                Image.cutBackground
                    .resizable()
                    .frame(width: screenWidth, height: cutBackgroundHeight, alignment: .center)
                
                Spacer()
            }
            
            // 🔥 Whole Section
            VStack(alignment: .leading) {
                // 🔥 Title, Description, Images
                VStack {
                    // 🔥 Text UI
                    // ✅ Text Format
                    Group {
                        Text("\(searchResult != nil ? searchResult!.name : "추천할 게 없어요 ㅠㅠ")")
                            .font(.system(size: 40, weight: .bold))
                        
                        Text("\(searchResult != nil ? searchResult!.description : "추천할 게 없어요 ㅠㅠ")")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.greenForeground)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    // 🔥 Image UI
                    HStack {
                        Image("RoundDriverButton")
                            .padding(40.0)
                            .frame(maxHeight:.infinity, alignment: .bottom)
                        
                        Spacer()
                        
                        Image("TestClub")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding([.top, .leading, .trailing])
                            .frame(maxHeight:.infinity, alignment: .bottom)
                    }
                }
                .frame(width: screenWidth, height: cutBackgroundHeight, alignment: .top)
                .clipped()
                
                // 🔥 Category, location, distance
                VStack(spacing: 20) {
                    HStack {
                        Image.category
                        
                        Spacer()
                        
                        Text("\(searchResult != nil ? searchResult!.category.rawValue : "추천할 게 없어요 ㅠㅠ")")
                            .foregroundColor(.white)
                    }
                    .frame(width: specWidth)
                    
                    HStack {
                        Image.location
                        
                        Spacer()
                        
                        Text("\(searchResult != nil ? searchResult!.location.rawValue : "추천할 게 없어요 ㅠㅠ")")
                            .foregroundColor(.white)
                    }
                    .frame(width: specWidth)
                    
                    HStack {
                        Image.distance
                        
                        Spacer()
                        
                        Text("\(searchResult != nil ? "\(String(describing: searchResult!.distance))" : "추천할 게 없어요 ㅠㅠ")")
                            .foregroundColor(.white)
                    }
                    .frame(width: specWidth)
                }
                .frame(width: screenWidth, height: specHeight)
            }// VStack whole section
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }// ZStack
    }// SampleDescriptionView Body
}// SampleDescriptionView

struct SampleDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
