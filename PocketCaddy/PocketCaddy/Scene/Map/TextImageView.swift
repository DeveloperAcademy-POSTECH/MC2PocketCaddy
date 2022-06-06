//
//  ImageView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/04.
//

import SwiftUI

struct TextImageView: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    @Binding var isCheck: [Bool]
    @Binding var sheetNum : Int
    var location : [Location]
    var index: Int
    var textFrameSize: [(x:CGFloat,y:CGFloat)] = [(x:150,y:80),(x:100,y:80),(x:100,y:70),(x:200,y:80)]

    var body: some View {
        Button(action: {
            for i in 0...3 {
                if i == index {
                    if isCheck[i] && sheetNum == 2 {
                        sheetNum = 3
                        return
                    }
                    if isCheck[i] {
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
            Image(location[index].rawValue + "Text")
                .resizable()
                .frame(width:textFrameSize[index].x , height: textFrameSize[index].y, alignment: .trailing)
                .cornerRadius(15)
                .opacity(isCheck[index] || (sheetNum != 2) ? 1 :  0.2)
        }
    }
               
}