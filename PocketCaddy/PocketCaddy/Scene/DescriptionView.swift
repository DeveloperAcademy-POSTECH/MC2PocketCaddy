//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var jsonDataManager : JsonDataManager
    
    var body: some View {
        VStack {
            // green rectangle components
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 310, height: 430)
                    .foregroundColor(.secondaryGreen)
                
                // club image and title
                VStack {
                    HStack(alignment: .bottom, spacing: -90) {
                        VStack(alignment: .leading) {
                            Text(jsonDataManager.selectedClub.name)
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight: .bold))
                            
                            Capsule()
                                .foregroundColor(.white)
                                .frame(width: 90, height: 35)
                                .overlay(
                                    Text(jsonDataManager.selectedClub.subName)
                                        .foregroundColor(.secondaryGreen)
                                        .fontWeight(.bold)
                                )
                        }
                        Image("DriverClubSample")
                        
                    }
                    .offset(x: 0, y: -50)
                    
                    HStack (spacing: 40) {
                        VStack {
                            Text("Length")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack(spacing: 5) {
                                Text("\(jsonDataManager.selectedClub.length.truncateDoubleTail())")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                
                                Text("cm")
                                    .foregroundColor(.white)
                                
                            }
                        }
                        .padding(.vertical, 50)
                        
                        InfoComponent(title: "Loft", otherValue: "\(jsonDataManager.selectedClub.loft)", unitValue: "°")
                        InfoComponent(title: "Distance", otherValue: "\(jsonDataManager.selectedClub.distance)", unitValue: "m")

                    }
                    .offset(x: 0, y: -30)
                }
                
            }
            
            Spacer()
            
            // gray rectangle components
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 310, height: 120)
                    .foregroundColor(.grayBackground)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("💡Tip")
                        .font(.system(size: 22))
                    
                    Text("\(jsonDataManager.selectedClub.description)")
                        .font(.system(size: 16))
                    
                }
                .padding(.horizontal, 50)
            }
                
        }
        .padding(.vertical, 90)
        
    }
}

struct InfoComponent: View {
    let title: String
    var otherValue: String
    var unitValue: String

    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(spacing: 5) {
                Text(otherValue)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                Text(unitValue)
                    .foregroundColor(.white)
            }
            
        }
        .padding(.vertical, 50)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
