//
//  DistanceButtonView.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/05.
//

import SwiftUI

struct DistanceButtonView: View {

    var body: some View {
        Button(action:{
            selectedDistance = buttonDistance
        }){
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 100)
                .foregroundColor(selectedDistance == buttonDistance ? .primaryGreen : .white)
                .padding(15)
                .overlay(
                    Text(buttonDistance.rawValue + "m")
                        .font(.system(size: 20))
                        .foregroundColor(selectedDistance == buttonDistance ? .white : .primaryGreen)
                        .bold()
                )
        }
    }
}
