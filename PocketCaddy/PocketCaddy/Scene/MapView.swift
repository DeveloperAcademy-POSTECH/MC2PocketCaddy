//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MapView: View {
    @State private var celsius = 0.0
    var Enviroment : [String] = ["teeingGround","bunker","hazard","rough"]
    @State var isCheck : [Bool] = [false,false,false,false]
    var body: some View {
        HStack{
            VStack{
                ForEach(0..<4){ i in
                    Button(action: {isCheck[i].toggle()}){
                        Image(Enviroment[i])
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .trailing)
                            .opacity(isCheck[i] ? 1 : 0.5)
                    }
                    
                }
               
            }
            VStack{
                Text(String(Int(celsius)))
                Image("land").resizable()
                    .frame(width: 100, height:  500)
                    .padding(20)
                    .overlay(
                        Slider(value: $celsius, in: 0...200, step: 0.1)
                            .rotationEffect(.degrees(-90.0), anchor: .topLeading)
                            .frame(width: 500)
                            .offset(x:230, y: 260))
            }
        }
    }
}

