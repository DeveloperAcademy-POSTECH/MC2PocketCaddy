//
//  ClubCardView.swift
//  PocketCaddy
//
//  Created by LeeJaehoon on 2022/06/11.
//

import SwiftUI

struct ClubCardView: View {
    // MARK: - PROPERTIES
    let clubModel: ClubModel
    
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Image(clubModel.name)
                .resizable()
                .scaledToFit()
                .frame(width: 110)
                .offset(y: -22)
  
            
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 0)
                Spacer()
                
                Text(clubModel.name)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                if let distance = clubModel.distance {
                    Text("\(clubModel.subName) (\(distance)m)")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                } else {
                    Text("\(clubModel.subName)")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
                
                /*
                Text("\(clubModel.subName) (\(clubModel.distance)m)")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                 */
                
                Spacer()

            } //: VSTACK
            .padding(.leading, 15)
            .frame(height: 69)
            .background(LinearGradient(gradient: Gradient(colors: [Color.primaryGreen, Color.primaryYellow]), startPoint: .leading, endPoint: .trailing))
            .offset(y: 65)
            
        } //: ZSTACK
        .frame(width: 168, height: 198)
        .background(Color.grayBackground)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 2, x: 0, y: 0)
        .padding(.bottom, 5)
    }
}

/*
struct ClubCardView_Previews: PreviewProvider {
    static var previews: some View {
        ClubCardView(clubInfo: ClubInfo.allClubInfo[0])
            .previewLayout(.sizeThatFits)
    }
}
 */
