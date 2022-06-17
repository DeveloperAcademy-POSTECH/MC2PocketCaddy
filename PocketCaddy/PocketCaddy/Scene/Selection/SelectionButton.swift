//
//  SelectionButton.swift
//  PocketCaddy
//
//  Created by Hyeon-sang Lee on 2022/06/16.
//

import SwiftUI

struct SelectionButtonDisabled: View {
    var body: some View {
        Text("선택 완료")
            .foregroundColor(.white)
            .font(Font.system(size: Screen.width * 0.045, weight: .bold))
            .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
            .background{
                RoundedRectangle(cornerRadius: Screen.height)
                    .foregroundColor(Color.backgroundWhite)
            }
            .transition(.opacity)
    }
}

struct SelectionButtonActive: View {
    @Binding var goBack: Bool
    @Binding var currentButtonStatus: Location?
    @Binding var value: Double
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.goBack = true
                self.currentButtonStatus = nil
                self.value = 0
            }
        }) {
            Text("선택 완료")
                .foregroundColor(.white)
                .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
                .background {
                    LinearGradient(gradient: Gradient(colors: [.secondaryGreen, .primaryGreen]), startPoint: .leading, endPoint: .trailing)
                        .cornerRadius(Screen.height)
                }
                .transition(.opacity)
        }
    }
}

