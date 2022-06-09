//
//  SelectionView.swift
//  PocketCaddy
//
//  Created by 유정인 on 2022/06/09.
//

import SwiftUI

struct SelectionView: View {
    @State private var distance: Double = 0
    @State var isEditing: Bool = true
    
    
    var body: some View {
        VStack {
            // 뒤로 가기 버튼
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .font(Font.system(size: 22, weight: .semibold))
                        .foregroundColor(.thirdGreen)
                }
                Spacer()
            }
            .padding()
            
            // 전체 뷰
            HStack {
                VStack(alignment: .leading) {
                    // 질문
                    HStack {
                        Text("현재")
                        Text("공")
                            .foregroundColor(.thirdGreen)
                        Text("은")
                            .offset(x: -8)
                    }
                    .font(.system(size: 34, weight: .bold))
                    
                    Text("어느 위치에 있나요?")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.bottom, 3)
                    
                    Text("공이 위치한 구역과 목표 거리를 입력해주세요 :)")
                        .foregroundColor(.fontGray)
                        .font(.system(size: 15))
                    
                    // Location, Distance
                    VStack {
                        HStack {
                            Text("Location")
                                .font(Font.system(size: 26, weight: .bold))
                            Spacer()
                            // MapView()로 이동
                            Button {
                                
                            } label: {
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.top, 30)
                        
                        // Location 선택 버튼
                        Group {
                            HStack {
                                LocationRectangle(buttonName: "Fairway & Rough", buttonImage: "FairwayRough")
                                LocationRectangle(buttonName: "Teeing Ground", buttonImage: "TeeingGround")
                            }
                            HStack {
                                LocationRectangle(buttonName: "Bunker", buttonImage: "Bunker")
                                LocationRectangle(buttonName: "Green", buttonImage: "Green")
                            }
                        }
                        
                        HStack {
                            Text("Distance")
                                .font(Font.system(size: 26, weight: .bold))
                            Spacer()
                        }
                        .padding(.top, 30)
                        
                        // 남은 거리 텍스트
                        HStack(spacing: 0) {
                            Text("“목표 거리는 ")
                            Text("\(distance, specifier: "%.f")m")
                                .foregroundColor(.primaryGreen)
                            Text("입니다.“")
                        }
                        .font(Font.system(size: 18, weight: .bold))
                        .padding(.top, 5)
                        
                        VStack {
                            Slider(value: $distance, in: 0...210, step: 5).accentColor(.primaryGreen)
                            HStack {
                                Text("0m")
                                Spacer()
                                Text("210m~")
                            }
                        }
                        Button {
                            
                        } label: {
                            Text("선택 완료")
                                .foregroundColor(.white)
                                .font(Font.system(size: 18, weight: .bold))
                                .frame(width: 110, height: 50)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [.gradientColorLight, .gradientColorDark]), startPoint: .leading, endPoint: .trailing)
                                        .cornerRadius(UIScreen.main.bounds.height)
                            )
                        }

                    }
                }
                // 전체 뷰에 대한 수평 padding
                .padding(.horizontal, 10)
            }
            // 전체 뷰에 대한 padding
            .padding()
            
            Spacer()
        }
    }
}

/// Location 선택 버튼
struct LocationRectangle: View {
    @State private var buttonClick: Bool = false
    var buttonName: String
    var buttonImage: String
    
    var body: some View {
        Button {
            self.buttonClick.toggle()
            
        } label: {
            ZStack {
                Image(buttonImage)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.43, height: 100)
                    .cornerRadius(8)
                    .opacity(buttonClick ? 1 : 0.3)
                Text(buttonName)
                    .font(Font.system(size: 16, weight: .bold))
                    .foregroundColor(buttonClick ? Color.white : Color.black)
            }
        }

    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
