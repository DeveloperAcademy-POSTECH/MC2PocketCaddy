//
//  ImageView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/06/04.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    @Binding var isCheck: [Bool]
    @Binding var sheetNum: Int
    var location: [Location]
    var index: Int
    var frameSize: [(x:CGFloat,y:CGFloat)] = [(x:80,y:80),(x:150,y:150),(x:150,y:100),(x:150,y:500)]
    
    var body: some View {
        Button(action: {
            for i in 0...3 {
                if i == index {
                    if isCheck[i] && sheetNum == 2 {
                        sheetNum = 3
                        return
                    }
                    sheetNum = 2
                    isCheck[i] = true
                }
                else {
                    isCheck[i] = false
                }
            }
        }){
            Image(isCheck[index] && sheetNum == 2 ? "Mapselected" + location[index].rawValue : "Map"+location[index].rawValue)
                .resizable()
                .frame(width:frameSize[index].x , height: frameSize[index].y, alignment: .trailing)
                .cornerRadius(15)
                .opacity(isCheck[index] || (sheetNum != 2) ? 1 :  0.2)
        }
    }
}
