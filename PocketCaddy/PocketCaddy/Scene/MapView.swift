//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI


struct MapView: View {
    var offset: [(x:CGFloat,y:CGFloat)] = [(x:100,y:270),(x:160,y:0),(x:-20,y:-300),(x:-10,y:0)]
    var frameSize: [(x:CGFloat,y:CGFloat)] = [(x:80,y:80),(x:150,y:150),(x:150,y:100),(x:150,y:500)]
    @State private var celsius = 0.0
    @State var sheetNum : Int = 1
    @State var environment : [String] = ["teeingGround","bunker","green","rough"]
    @State var selectedEnvironment : [String] = ["selectedTeeingGround","selectedBunker","selectedGreen","selectedRough"]
    @State var distance : [[Int]] = [[50,99], [100,149], [150,199], [200,249], [250,299], [300,500]]
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
                Rectangle().opacity(sheetNum == 1 ? 0 : 0.1).ignoresSafeArea()
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
                    Text("3")
                        .font(.system(size: 25))
                        .foregroundColor(.white).bold()
                }.padding(50).offset(x: 150, y: -400)
            VStack{
                ZStack{
                    ForEach(0..<4) {i in
                        ImageView(isCheck: $isCheck, selectedEnvironment: $selectedEnvironment, sheetNum: $sheetNum, environment: $environment,index: i, frameSize: frameSize[i]).offset(x: offset[i].x, y: offset[i].y)
                    }
                    
//                    Button(action: {
//                        for i in 0...3 {
//                            if i == 1 {
//                                if isCheck[i] && sheetNum == 2 {
//                                    sheetNum = 3
//                                    return
//                                }
//                                if isCheck[i]{
//                                    sheetNum = 2
//                                    return
//                                }
//                                isCheck[i] = true
//                            }
//                            else {
//                                isCheck[i] = false
//                            }
//                        }
//                    }){
//                        Image(isCheck[1] ? selectedEnvironment[1] : environment[1])
//                            .resizable()
//                            .frame(width: 150, height: 150, alignment: .trailing)
//                            .cornerRadius(15)
//                            .opacity(isCheck[1] || (sheetNum != 2) ? 1 :  0.2)
//                    }           .offset(x: 160, y: 0)
//
//                    Button(action: {
//                        for i in 0...3 {
//                            if i == 2 {
//                                if isCheck[i] && sheetNum == 2 {
//                                    sheetNum = 3
//                                    return
//                                }
//                                if isCheck[i]{
//                                    sheetNum = 2
//                                    return
//                                }
//                                isCheck[i] = true
//                            }
//                            else {
//                                isCheck[i] = false
//                            }
//                       }
//                    }){
//                        Image(isCheck[2] ? selectedEnvironment[2] : environment[2])
//                            .resizable()
//                            .frame(width: 150, height: 100, alignment: .trailing)
//                            .cornerRadius(15)
//                            .opacity(isCheck[2] || (sheetNum != 2) ? 1 :  0.2)
//                    }.offset(x: -20, y: -300)
//
//                    Button(action: {
//                        for i in 0...3 {
//                            if i == 3 {
//                                if isCheck[i] && sheetNum == 2 {
//                                    sheetNum = 3
//                                    return
//                                }
//                                if isCheck[i]{
//                                    sheetNum = 2
//                                    return
//                                }
//                                isCheck[i] = true
//                            }
//                            else {
//                                isCheck[i] = false
//                            }
//                        }
//                    }){
//                        Image(isCheck[3] ? selectedEnvironment[3] : environment[3])
//                            .resizable()
//                            .frame(width: 150, height: 500, alignment: .trailing)
//                            .cornerRadius(15)
//                            .opacity(isCheck[3] || (sheetNum != 2) ? 1 :  0.2)
//                    }           .offset(x: -10, y: 0)
//
                    Button(action: {
                            for i in 0...3 {
                                if i == 0 {
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
                        Image("teeingGroundText")
                            .resizable()
                            .frame(width: 150, height: 80, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[0] || (sheetNum != 2) ? 1 :  0.2)
                    }.offset(x: 80, y: 210)
                    
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
                        Image("bunkerText")
                            .resizable()
                            .frame(width: 100, height: 80, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[1] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: 120, y: -20)
                    
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
                        Image("greenText")
                            .resizable()
                            .frame(width: 100, height: 70, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[2] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: 60, y: -300)
                    
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
                        Image("roughText")
                            .resizable()
                            .frame(width: 200, height: 80, alignment: .trailing)
                            .cornerRadius(15)
                            .opacity(isCheck[3] || (sheetNum != 2) ? 1 :  0.2)
                    }           .offset(x: 40, y: -180)
                }
            }

                
                Rectangle().opacity(sheetNum == 3 ? 0.5 : 0).ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
            
            VStack(){
           
                if sheetNum == 3 {
                    Text("How far?")
                        .font(.system(size: 50))
                        .foregroundColor(.primaryWhite).bold()
                        .padding(20)
                        .offset(x: -70)
                    HStack{
                        Button(action:{
                            for i in 0...5 {
                                if i == 0 {
                                    if isDistanceCheck[i] {
                                      
                                        guard let club = JsonDataManager().searchClub(location: "Fairway & Rough", dxMin: distance[i][0] , dxMax: distance[i][1]) else {
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
                            .foregroundColor(isDistanceCheck[0] ? .secondaryGreen : .primaryWhite)
                            .padding(15)
                            .overlay(
                                Text("0 ~ 50m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[0] ? .primaryWhite : .primaryGreen).bold())
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
                            .foregroundColor(isDistanceCheck[1] ? .primaryGreen : .primaryWhite)
                            .padding(15)
                            .overlay(
                                Text("50 ~ 100m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[1] ? .white : .primaryGreen).bold())
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
                            .foregroundColor(isDistanceCheck[2] ? .primaryGreen : .primaryWhite)
                            .padding(15)
                            .overlay(
                                Text("100 ~ 150m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[2] ? .primaryWhite : .primaryGreen).bold())
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
                            .foregroundColor(isDistanceCheck[3] ? .primaryGreen : .primaryWhite)
                            .padding(15)
                            .overlay(
                                Text("150 ~ 200m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[3] ? .primaryWhite : .primaryGreen).bold())
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
                            .foregroundColor(isDistanceCheck[4] ? .primaryGreen : .primaryWhite)
                            .padding(15)
                            .overlay(
                                Text("200 ~ 300m")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[4] ? .white : .primaryGreen).bold())
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
                            .foregroundColor(isDistanceCheck[5] ? .primaryGreen : .white)
                            .padding(15)
                            .overlay(
                                Text("300m ~")
                                    .font(.system(size: 20))
                                    .foregroundColor(isDistanceCheck[5] ? .white : .primaryGreen).bold())
                        }
                    }
                    
                    
                    
                    NavigationLink(destination: DescriptionView()){
                    RoundedRectangle(cornerRadius: 10)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.primaryGreen)
                    .padding(15)
                    .overlay(
                        Text("Choose")
                            .font(.system(size: 20))
                            .foregroundColor(.white).bold())
                    }
                    
                }
                Spacer()
            } // VStack
        } // ZStack
        } // NavigationView
  
    } // body
} // View

//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(, index: <#Int#>)
//    }
//}
