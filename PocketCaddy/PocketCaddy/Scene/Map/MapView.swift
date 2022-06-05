//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MapView: View {
    var offset: [(x:CGFloat,y:CGFloat)] = [(x:100,y:270),(x:160,y:0),(x:-20,y:-300),(x:-10,y:0)]
    var textImageOffset: [(x:CGFloat,y:CGFloat)] = [(x:80,y:210),(x:120,y:-20),(x:60,y:-300),(x:40,y:-180)]
    @State private var celsius = 0.0
    @State var sheetNum : Int = 1
    @State var environment : [String] = ["teeingGround","bunker","green","rough"]
    @State var textEnvironment : [String] = ["teeingGroundText","bunkerText","greenText","roughText"]
    @State var selectedEnvironment : [String] = ["selectedTeeingGround","selectedBunker","selectedGreen","selectedRough"]
    @State var distance : [(Int,Int)] = [(50,99), (100,149), (150,199), (200,249), (250,299), (300,500)]
    @State var isCheck : [Bool] = [true,false,false,false]
    @State var selectedDistance: Distance = .zero
    @EnvironmentObject var jsonDataManager: JsonDataManager
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("field")
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1.9),contentMode: .fill)
                    .ignoresSafeArea()
                
                Rectangle()
                    .opacity(sheetNum == 1 ? 0 : 0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
                
                Text(sheetNum.description + "/3")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 150, y: -400)

                ForEach(0..<4) {i in
                    ImageView(isCheck: $isCheck, selectedEnvironment: $selectedEnvironment, sheetNum: $sheetNum, environment: $environment,index: i)
                        .offset(x: offset[i].x, y: offset[i].y)
                }

                ForEach(0..<4) {i in
                    TextImageView(isCheck: $isCheck, selectedEnvironment: $selectedEnvironment, sheetNum: $sheetNum, environment: $environment,textEnvironment: $textEnvironment, index: i)
                        .offset(x: textImageOffset[i].x, y: textImageOffset[i].y)
                }
                
                Rectangle()
                        .opacity(sheetNum == 3 ? 0.5 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            sheetNum -= 1
                        }
                
                VStack() {
                    if sheetNum == 3 {
                        Text("How far?")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(.primaryWhite)
                            .padding(20)
                            .offset(x: -70)
                        
                        HStack{
                            DistanceButtonView(buttonDistance: .zero, selectedDistance: $selectedDistance)
                            DistanceButtonView(buttonDistance: .fifty, selectedDistance: $selectedDistance)
                        }
                        
                        HStack{
                            DistanceButtonView(buttonDistance: .hundred, selectedDistance: $selectedDistance)
                            DistanceButtonView(buttonDistance: .hundredFifty, selectedDistance: $selectedDistance)
                        }
                        
                        HStack{
                            DistanceButtonView(buttonDistance: .twoHundred, selectedDistance: $selectedDistance)
                            DistanceButtonView(buttonDistance: .threeHundred, selectedDistance: $selectedDistance)
                        }
                        
                        NavigationLink(destination: DescriptionView()){
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 50)
                                .foregroundColor(.primaryGreen)
                                .padding(15)
                                .overlay(
                                    Text("Choose")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .bold()
                                )
                        }.onTapGesture {
                            JsonDataManager().searchClub(location: "teeingGround", selectedDistance: selectedDistance)
                            
                        }
                    }
                    Spacer()
                } // VStack
            } // ZStack
        } // NavigationView
  
    } // body
} // View

enum Location: String {
    case green = "green"
    case fairwayAndRough = "rough"
    case bunker = "bunker"
    case teeingGround = "teeingGround"
}

enum Distance: String {
    case zero = "0~50"
    case fifty = "50~100"
    case hundred = "100~150"
    case hundredFifty = "150~200"
    case twoHundred = "200~300"
    case threeHundred = "300~"
}
