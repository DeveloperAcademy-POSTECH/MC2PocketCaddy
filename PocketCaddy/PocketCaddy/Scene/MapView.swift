//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MapView: View {
    @State private var celsius = 0.0
    @State var sheetNum : Int = 1
    var environment : [String] = ["teeing ground","bunker","green","rough"]
    var selectedEnvironment : [String] = ["selectedTeeingGround","selectedBunker","selectedGreen","selectedRough"]
    var distance : [Int] = [50, 100, 150, 200, 250, 300]
    @State var isCheck : [Bool] = [true,false,false,false]
    @State var isDistanceCheck : [Bool] = [true, false, false, false, false, false]
    @EnvironmentObject var jsonDataManager: JsonDataManager
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("field")
                    .resizable()
                    .aspectRatio(CGSize(width: 1, height: 1.9),contentMode: .fill)
                    .ignoresSafeArea()
                Rectangle().opacity(sheetNum == 1 ? 0 : 0.5).ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
                HStack{
                    Text(String(sheetNum))
                        .font(.system(size: 25))
                        .foregroundColor(.white).bold()
                    Text("/")
                        .font(.system(size: 25))
                        .foregroundColor(.white).bold()
                    Text("2")
                        .font(.system(size: 25))
                        .foregroundColor(.white).bold()
                }.padding(50).offset(x: 150, y: -400)
            VStack{
                ZStack{
                    Button(action: {
                        for i in 0...3 {
                            if isCheck[i] && sheetNum == 2 {
                                sheetNum = 3
                                return
                            }
                            if i == 0 {
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
                        Image(isCheck[0] ? selectedEnvironment[0] : environment[0])
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[0] || (sheetNum != 2) ? 1 :  0.2)
                    }.offset(x: 100, y: 270)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 1 {
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
                        Image(isCheck[1] ? selectedEnvironment[1] : environment[1])
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[1] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: 160, y: 0)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 2 {
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
                        Image(isCheck[2] ? selectedEnvironment[2] : environment[2])
                            .resizable()
                            .frame(width: 150, height: 100, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[2] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: -20, y: -300)
                    
                    Button(action: {
                        for i in 0...3 {
                            if i == 3 {
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
                        Image(isCheck[3] ? selectedEnvironment[3] : environment[3])
                            .resizable()
                            .frame(width: 150, height: 500, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[3] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: -10, y: 0)

                }
            }

            
            VStack(){
                Spacer()
                Spacer()
                if sheetNum == 3 {
                    Text("How far?")
                        .font(.system(size: 50))
                        .foregroundColor(.white).bold()
                        .padding(20)
                        .offset(x: -70)
                    HStack{
                        Button(action:{
                            for i in 0...5 {
                                if i == 0 {
                                    if isDistanceCheck[i] {
                                      
                                        guard let club = JsonDataManager().searchClub(location: "Fairway & Rough", dxMin: 0 , dxMax: distance[i]+300) else {
                                            return
                                        }
                                        jsonDataManager.selectedClub = club
                                        //디스크립션 뷰 띄우기
                                    }
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[0] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("0 ~ 50m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[0] ? .white : .black).bold())
                        }
                        Button(action:{
                            for i in 0...5 {
                                if i == 1 {
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[1] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("50 ~ 100m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[1] ? .white : .black).bold())
                        }
                    }
                    HStack{
                        Button(action:{
                            for i in 0...5 {
                                if i == 2 {
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[2] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("100 ~ 150m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[2] ? .white : .black).bold())
                        }
                        Button(action:{
                            for i in 0...5 {
                                if i == 3 {
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[3] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("150 ~ 200m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[3] ? .white : .black).bold())
                        }
                    }
                    HStack{
                        Button(action:{
                            for i in 0...5 {
                                if i == 4 {
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[4] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("200 ~ 300m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[4] ? .white : .black).bold())
                        }
                        Button(action:{
                            for i in 0...5 {
                                if i == 5 {
                                    isDistanceCheck[i] = true
                                }
                                else {
                                    isDistanceCheck[i] = false
                                }
                            }
                        }){
                            RoundedRectangle(cornerRadius: 10)
                            .frame(width: 150, height: 100)
                            .foregroundColor(isDistanceCheck[5] ? .black : .white)
                            .padding(15)
                            .overlay(
                                Text("300m ~")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[5] ? .white : .black).bold())
                        }
                    }
                }
                Spacer()
            } // VStack
        } // ZStack
        } // NavigationView
  
    } // body
} // View


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
