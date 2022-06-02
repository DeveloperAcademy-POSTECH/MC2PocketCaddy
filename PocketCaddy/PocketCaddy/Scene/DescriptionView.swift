//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack {
            // Title and name stack
            Group {
                // Title
                Text("CLUB")
                    .font(.system(
                        size: 45,
                        weight: .heavy,
                        design: .default)
                    )
                // Name of the selected club
                Text("Driver")
                    .font(.system(
                        size: 25,
                        weight: .medium)
                    )
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Sample Image
            Image(systemName: "pencil")
                .resizable()
                .frame(width: 300, height: 300)
            
            // Two rectangles under the selected club image
            VStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 80)
                
                Spacer()
                    .frame(height: 20)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 80)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            
        }// VStack
    }// body
}// DescriptionView

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
