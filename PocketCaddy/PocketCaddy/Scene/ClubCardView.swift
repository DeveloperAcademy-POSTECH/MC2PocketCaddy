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
                .frame(width: Screen.width * 0.282)
                .offset(y: Screen.height * -0.026)
  
            
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 0)
                Spacer()
                
                Text(clubModel.name)
                    .foregroundColor(.white)
                    .font(.system(size: Screen.width * 0.046))
                    .fontWeight(.bold)
                
                if let distance = clubModel.distance {
                    Text("\(clubModel.subName) (\(distance)m)")
                        .foregroundColor(.white)
                        .font(.system(size: Screen.width * 0.0358))
                } else {
                    Text("\(clubModel.subName)")
                        .foregroundColor(.white)
                        .font(.system(size: Screen.width * 0.0358))
                }
                
                Spacer()

            } //: VSTACK
            .padding(.leading, Screen.width * 0.0384)
            .frame(height: Screen.height * 0.081)
            .background(LinearGradient(gradient: Gradient(colors: [Color.primaryGreen, Color.secondaryGreen]), startPoint: .leading, endPoint: .trailing))
            .offset(y: Screen.height * 0.077)
            
        } //: ZSTACK
        .frame(width: Screen.width * 0.43, height: Screen.height * 0.235)
        .background(Color.backgroundWhite)
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
