//
//  SampleSelectionComponents.swift
//  PocketCaddy
//
//  Created by Noah's Ark on 2022/06/10.
//

import SwiftUI

// MARK: Location 선택 버튼
struct SampleLocationRectangle: View {
    // Binding Variables
    @Binding var buttonStatus: String
    @State var buttonPressed: Bool = false
    
    // Variables
    var buttonName: String
    var buttonImage: String
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        Button {
            if self.buttonPressed {
                self.buttonPressed = false
                buttonStatus = ""
            } else {
                self.buttonPressed = true
                buttonStatus = buttonName
            }            
        } label: {
            ZStack {
                Image(buttonImage)
                    .resizable()
                    .frame(width: screenWidth * 0.43, height: screenHeight * 0.12)
                    .cornerRadius(8)
                    .opacity(buttonPressed ? 1 : 0.3)
                Text(buttonName)
                    .font(Font.system(size: screenWidth * 0.042, weight: .bold))
                    .foregroundColor(buttonPressed ? Color.white : Color.black)
            }// ZStack
        }// Label
        .onChange(of: buttonStatus) { newValue in
            if newValue != buttonName {
                self.buttonPressed = false
            }
        }
        
    }// SampleLocationRectangle: body
}// SampleLocationRectangle
