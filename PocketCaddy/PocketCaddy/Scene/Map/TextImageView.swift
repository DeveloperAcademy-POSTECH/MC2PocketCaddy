//
//  ImageView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/04.
//

import SwiftUI

struct TextImageView: View {
    @EnvironmentObject var jsonDataManager: JsonDataManager
    @Binding var isCheck: [Bool]
    @Binding var selectedEnvironment: [String]
    @Binding var sheetNum : Int
    @Binding var environment : [String]
    @Binding var textEnvironment : [String]
    var index: Int
    var textFrameSize: (x:CGFloat,y:CGFloat)
    
    var body: some View {
        Button(action: {
            for i in 0...3 {
                if i == index {
                    if isCheck[i] && sheetNum == 2 {
                        sheetNum = 3
                        return
                    }
                    if isCheck[i]{
                        sheetNum = 2
                        return
                    }
                    isCheck[i] = true
                }
                else {
                    isCheck[i] = false
                }
            }
        }){
            Image(textEnvironment[index])
                .resizable()
                .frame(width:textFrameSize.x , height: textFrameSize.y, alignment: .trailing)
                .cornerRadius(15)
                .opacity(isCheck[index] || (sheetNum != 2) ? 1 :  0.2)
        }
    }
               
}
