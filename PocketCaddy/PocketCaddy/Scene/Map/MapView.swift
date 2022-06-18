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
    @GestureState private var dragOffset = CGSize.zero

    @State private var celsius = 0.0
    @State var sheetNum : Int = 1
    @State var isCheck : [Bool] = [true,false,false,false]
    @Binding var selectedLocation: Location?
    var location : [Location] = Location.allCases
    var offset: [(x:CGFloat,y:CGFloat)] = [(x:80,y:300),(x:160,y:10),(x:-20,y:-290),(x:-10,y:10)]
    var textImageOffset: [(x:CGFloat,y:CGFloat)] = [(x:0,y:280),(x:120,y:-20),(x:60,y:-320),(x:80,y:-120)]
    var distance : [(Int,Int)] = [(50,99), (100,149), (150,199), (200,249), (250,299), (300,500)]
    
    var body: some View {
        
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
                    .opacity(sheetNum == 2 ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sheetNum -= 1
                    }
                
                VStack {
                    if sheetNum == 2 {
                    
                        if isCheck[0] {
                            Spacer()
                            Text("Teeing ground")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundColor(.white)
                                .padding(20)
                            
                            Text(" 티잉그라운드(teeing ground)는 골프의 홀에서 경기를 시작하는 지대이다.\n 티박스(tee box)라고도 부르며, 여기서 골프를 치는 행위는 티샷(tee shot)이라고 한다. 티잉그라운드의 경계는 한 쌍의 티마커(tee marker)에 의해 정의된다.\n\n 각 홀에서 첫번째로 공을 치는 출발 지역. 좁고 평탄한 지역으로 티(페그)라고 하는 나무 또는 플라스틱으로 만든 못 위에 골프공을 얹어 놓고 친다.\n\n 다음 지역부터는 공을 티 위에 얹어 놓지 않고 그라운드에 놓인 대로 친다")
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            Spacer()
                        }
                        else if isCheck[1] {
                            Spacer()
                            Text("Bunker")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundColor(.white)
                                .padding(20)
                            Text(" 벙커 는 일반적으로 모래로 채워진 그린 이나 페어웨이 근처의 함몰된 곳이며 밖으로 공을 걷어내는 것이 어렵다.\n (보통 '샌드 웨지'라는 클럽을 사용한다.) \n\n 연습이나 스트로크를 위한 백스윙 과정에서 공 뒤 모래를 건드리면 페널티를 받고 벙커 사용을 마친 후에는 모래를 고무래를 사용하여 사용 전의 상태로 돌려 놓아야한다.")
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            Spacer()
                        }
                        else if isCheck[2] {
                            Spacer()
                            Text("Green")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundColor(.white)
                                .padding(20)
                            Text(" 퍼팅 그린(putting green)은 평균 660∼990m2(200∼300평) 넓이에 잔디를 매우 짧게 깎아놓아 다듬은 곳이다.\n\n 그린에는 지름 10.79cm(4.25인치)의 구멍이 있으며 홀(hole)또는 컵(cup, 일본에서만 사용)이라고 한다.\n 홀은 멀리서도 위치를 식별할 수 있도록 홀에 핀(깃대)를 꽃아 세워놓는다.\n\n 공이 그린에 올려진 후 퍼터(putter)를 이용해서 홀에 넣으면(홀 인, hole in) 그 홀의 경기는 끝난다.")
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            Spacer()
                        }
                        else if isCheck[3] {
                            Spacer()
                            Text("Fairway\n& Rough")
                                .font(.system(size: 50))
                                .bold()
                                .foregroundColor(.white)
                                .padding(20)
                            Text(" \(Text("Fairway").bold()) \n 페어웨이(fairway)는 '정상적인 통로'라는 뜻을 가진 티에서 그린까지 구간의 중앙 부분에 있는 코스 대부분을 차지하는 곳으로, 잔디를 잘 다듬어 정상적인 타격감을 가지고 있다.\n\n \(Text("Rough").bold())\n 러프(rough)는 페어웨이의 외곽 부분에 잔디를 덜 다듬어 잡초 및 수림으로 형성된 것으로 타격감이 페어웨이보다 떨어지는 곳이다.")
                                .foregroundColor(.white)
                                .padding(20)
                            Spacer()
                            Spacer()
                        }
                    }
                    
                    Spacer()

                } // VStack
                CustomBackButton2(presentationMode: presentationMode)
                    .offset(x: 0, y: -Screen.height * 135/300)
            }// ZStack
            .preferredColorScheme(clubDataManager.selectedAppearance ? .light : .dark)
            .navigationBarHidden(true)
            .contentShape(Rectangle())
            .gesture(DragGesture().updating($dragOffset) { (value, state, transaction) in
                if (value.startLocation.x < 30 && value.translation.width > 100) {
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
    }// body
}// View

