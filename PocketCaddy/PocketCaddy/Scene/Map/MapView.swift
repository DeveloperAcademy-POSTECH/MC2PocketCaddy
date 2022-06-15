//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var clubDataManager: ClubDataManager
    @State private var celsius = 0.0
    @State var sheetNum : Int = 1
    @State var isCheck : [Bool] = [true,false,false,false]
    @State var selectedDistance: Distance = .zero
    var location : [Location] = Location.allCases
    var offset: [(x:CGFloat,y:CGFloat)] = [(x:80,y:320),(x:160,y:30),(x:-20,y:-270),(x:-10,y:30)]
    var textImageOffset: [(x:CGFloat,y:CGFloat)] = [(x:0,y:300),(x:120,y:0),(x:60,y:-300),(x:100,y:-100)]
    var distance : [(Int,Int)] = [(50,99), (100,149), (150,199), (200,249), (250,299), (300,500)]
    
    var body: some View {
        let distanceButtonArray: [DistanceButtonView] = [
            DistanceButtonView(buttonDistance: .zero, selectedDistance: $selectedDistance),
            DistanceButtonView(buttonDistance: .fifty, selectedDistance: $selectedDistance),
            DistanceButtonView(buttonDistance: .hundred, selectedDistance: $selectedDistance),
            DistanceButtonView(buttonDistance: .hundredFifty, selectedDistance: $selectedDistance),
            DistanceButtonView(buttonDistance: .twoHundred, selectedDistance: $selectedDistance),
            DistanceButtonView(buttonDistance: .threeHundred, selectedDistance: $selectedDistance)
        ]
        
        NavigationView {
            ZStack {
                Image("field")
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1.9),contentMode: .fill)
                    .ignoresSafeArea()
                
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(sheetNum == 1 ? 0 : 0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
                
                CustomBackButton(presentationMode: presentationMode)
                
                ForEach(0..<4) {i in
                    ImageView(
                        isCheck: $isCheck,
                        sheetNum: $sheetNum,
                        location: location,
                        index: i
                    )
                    .offset(
                        x: offset[i].x,
                        y: offset[i].y
                    )
                }
                
                ForEach(0..<4) {i in
                    TextImageView(
                        isCheck: $isCheck,
                        sheetNum: $sheetNum,
                        location: location,
                        index: i
                    )
                    .offset(
                        x: textImageOffset[i].x,
                        y: textImageOffset[i].y
                    )
                }
                
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(sheetNum == 3 ? 0.7 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
                
                VStack {
                    if sheetNum == 3 {
                        Spacer()
                        
                        Text("How far?")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(.white)
                            .padding(20)
                            .offset(x: -70)
                        
                        // Location Button Grid
                        LazyVGrid(columns: LazyVGridColumns) {
                            ForEach(0..<distanceButtonArray.count, id: \.self) {index in
                                distanceButtonArray[index]
                            }
                        }
                    }
                    
                    Spacer()
                    
                } // VStack
                
            }// ZStack
            .preferredColorScheme(.dark)
        }// NavigationView
    }// body
}// View

enum Distance: String {
    case zero = "0~50"
    case fifty = "50~100"
    case hundred = "100~150"
    case hundredFifty = "150~200"
    case twoHundred = "200~300"
    case threeHundred = "300~"
}
