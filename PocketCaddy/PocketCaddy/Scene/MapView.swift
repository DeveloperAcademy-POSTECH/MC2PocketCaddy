//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MapView: View {
    @State private var celsius = 0.0
    @State var SheetNum : Int = 1
    var Enviroment : [String] = ["teeingGround","bunker","green","rough"]
    var SelectedEnviroment : [String] = ["selectedTeeingGround","selectedBunker","selectedGreen","selectedRough"]
    @State var isCheck : [Bool] = [true,false,false,false]
    var body: some View {
        ZStack{
          
            Image("field").resizable().aspectRatio(CGSize(width: 1, height: 1.9),contentMode: .fit)
            VStack{
                ZStack{
                    Button(action: {
                        for i in 0...3 {
                            if i == 0 {
                                isCheck[i] = true
                            }
                            else {
                                isCheck[i] = false
                            }
                        }
                    }){
                        Image(isCheck[0] ? SelectedEnviroment[0] : Enviroment[0])
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[0] ? 1 :  0.7)
                    }.offset(x: 100, y: 270)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 1 {
                                isCheck[i] = true
                            }
                            else {
                                isCheck[i] = false
                            }
                        }
                    }){
                        Image(isCheck[1] ? SelectedEnviroment[1] : Enviroment[1])
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[1] ? 1 : 0.7)
                    }           .offset(x: 130, y: 0)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 2 {
                                isCheck[i] = true
                            }
                            else {
                                isCheck[i] = false
                            }
                        }
                    }){
                        Image(isCheck[2] ? SelectedEnviroment[2] : Enviroment[2])
                            .resizable()
                            .frame(width: 150, height: 100, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[2] ? 1 : 0.7)
                    }           .offset(x: -20, y: -300)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 3 {
                                isCheck[i] = true
                            }
                            else {
                                isCheck[i] = false
                            }
                        }
                    }){
                        Image(isCheck[3] ? SelectedEnviroment[3] : Enviroment[3])
                            .resizable()
                            .frame(width: 180, height: 500, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[3] ? 1 : 0.7)
                    }           .offset(x: -30, y: 0)

                }
            }
            
            Rectangle().opacity(SheetNum == 1 ? 0 : 0.3).frame(height: 742)
            VStack{
                Spacer()
                Spacer()
                if SheetNum == 2 {
                    HStack{
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                    }
                    HStack{
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                    }
                    HStack{
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                        
                        Button(action:{}){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(.white)
                            .padding(15)
                        }
                    }
                }
                Spacer()
                HStack{
                    Button(action:{
                        if SheetNum == 2 {
                        SheetNum -= 1
                        }
                    }){
                        Image(systemName: "play.fill").rotationEffect(.degrees(180))
                            .foregroundColor(.white)
                    }
                    Text(String(SheetNum))
                        .foregroundColor(.white).bold()
                    Text("/")
                        .foregroundColor(.white).bold()
                    Text("2")
                        .foregroundColor(.white).bold()
                    
                    Button(action:{
                        if SheetNum == 1 {
                        SheetNum += 1
                        }
                    }){
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                    }
                }.padding(50)
            }
        } // ZStack
    } // body
} // View

