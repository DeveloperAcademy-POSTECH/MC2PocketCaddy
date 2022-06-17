//
//  SelectionView.swift
//  PocketCaddy
//
//  Created by 유정인 on 2022/06/09.
//

import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var clubDataManager: ClubDataManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var value: Double = 0
    @State var currentButtonStatus: Location? = nil
    @State var goToMapView: Bool = false
    @State var goBack: Bool = false
    @State var isPressed = false
    
    @Binding var isLocationAndDistanceActive: Bool
    
    @GestureState var longPressTap = false
    
    private let minDistance: Double = 60
    private let maxDistance: Double = 210
    
    var body: some View {
        let locationButtonArray: [LocationRectangle] = [
            LocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .fairwayAndRough, buttonImage: "FairwayRough"),
            LocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .teeingGround, buttonImage: "TeeingGround"),
            LocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .bunker, buttonImage: "Bunker"),
            LocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .green, buttonImage: "Green")
        ]
        
        VStack {
            if goBack == false {
                // SelectionView
                VStack {
                    CustomBackButtonGoBack()
                        .transition(.opacity)
                        .opacity(longPressTap ? 0.4 : 1.0)
                        .gesture(
                            LongPressGesture(minimumDuration: 1000000)
                                .updating($longPressTap, body: { (currentState, state, transaction) in
                                    state = currentState
                                })
                        )
                        .simultaneousGesture(TapGesture()
                            .onEnded { _ in
                                self.isLocationAndDistanceActive.toggle()
                            })
//                        .onTapGesture {
//                            withAnimation {
//                                self.isLocationAndDistanceActive.toggle()
//                            }
//                        }
                    
                    VStack {
                        // Title
                        HStack {
                            VStack(alignment: .leading) {
                                Text("현재 \(Text("공").foregroundColor(.primaryGreen))은\n어느 위치에 있나요?")
                                    .font(.system(size: Screen.width * 0.09, weight: .bold))
                                    .fixedSize(horizontal: true, vertical: true)
                                    .padding(.bottom, Screen.width * 0.005)                                
                            }
                            .padding(.bottom, Screen.height * 0.04)
                            
                            Spacer()
                        }
                        
                        // Location Section
                        HStack {
                            Text("Location")
                                .font(Font.system(size: Screen.width * 0.07, weight: .bold))
                            Spacer()
                        }
                        
                        // Location Button Grid
                        LazyVGrid(columns: LazyVGridColumns) {
                            ForEach(0..<locationButtonArray.count, id: \.self) {index in
                                locationButtonArray[index]
                                    .padding(index % 2 == 0 ? .trailing : .leading, Screen.width * 0.005)
                            }
                        }.onChange(of: currentButtonStatus) { _ in
                            self.searchClub()
                        }
                        
                        // Distance Section
                        switch currentButtonStatus {
                        case .fairwayAndRough:
                            VStack {
                                HStack {
                                    Text("Distance")
                                        .font(Font.system(size: Screen.width * 0.07, weight: .bold))
                                        .foregroundColor(currentButtonStatus != .fairwayAndRough ? .secondary : .black)
                                    Spacer()
                                }
                                .padding(.top, Screen.height * 0.03)
                                
                                Text("“목표 거리는 \(Text("\(Int(value))m").foregroundColor(currentButtonStatus != .fairwayAndRough ? .secondary : .primaryGreen))입니다.“")
                                    .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                                    .padding(.top, 5)
                                    .foregroundColor(currentButtonStatus != .fairwayAndRough ? .secondary : .black)
                                
                                Slider(value: $value, in: minDistance...maxDistance, step: 5) {
                                    Text("Distance")
                                } minimumValueLabel: {
                                    Text("\(Int(minDistance))m")
                                } maximumValueLabel: {
                                    Text("\(Int(maxDistance))m")
                                }
                                .foregroundColor(currentButtonStatus != .fairwayAndRough ? .secondary : .black)
                                .accentColor(currentButtonStatus != .fairwayAndRough ? .secondary : .primaryGreen)
                                .disabled(currentButtonStatus != .fairwayAndRough)
                                .onChange(of: value) { _ in
                                    self.searchClub()
                                }
                                
                                Spacer()
                                    .frame(height: Screen.height * 0.05)
                                
                            }
                        default:
                            Spacer()
                                .frame(height: Screen.height * 0.05)
                        }
                        
                        switch currentButtonStatus {
                        case .fairwayAndRough:
                            if value == 0 {
                                SelectionButtonDisabled()
                            } else {
                                SelectionButtonActive(goBack: $goBack, currentButtonStatus: $currentButtonStatus, value: $value)
                            }
                        default:
                            if currentButtonStatus == nil {
                                SelectionButtonDisabled()
                            } else {
                                SelectionButtonActive(goBack: $goBack, currentButtonStatus: $currentButtonStatus, value: $value)
                            }
                            
                        }// Switch
                        
                        Spacer()
                        
                    }// VStack under the custom back button
                    .padding(.horizontal, Screen.width * 0.06)
                    
                }
                // Selection VStack
            } else {
               DescriptionPageView(goBack: $goBack)
                   .transition(.opacity)
                   .navigationBarHidden(true)
            }

            
        }// Whole VStack
    }// body
    
    // MARK: 선택 완료 버튼 함수 처리
    func searchClub() {
        guard let location = currentButtonStatus else { return }
        self.clubDataManager.searchClub(location: location, selectedDistance: Int(value))
    }// searchClub
    
}// SelectionView

/// Location 선택 버튼
struct LocationRectangle: View {
    @State var buttonPressed: Bool = false
    @Binding var buttonStatus: Location?
    
    var buttonName: Location
    var buttonImage: String
    
    var body: some View {
        Button {
            withAnimation {
                if self.buttonPressed {
                    self.buttonPressed = false
                    buttonStatus = nil
                } else {
                    self.buttonPressed = true
                    buttonStatus = buttonName
                }
            }
        } label: {
            ZStack {
                Image(buttonImage)
                    .resizable()
                    .frame(width: Screen.width * 0.43, height: Screen.height * 0.12)
                    .cornerRadius(8)
                    .opacity(buttonPressed ? 1 : 0.3)
                Text(buttonName.rawValue)
                    .font(Font.system(size: Screen.width * 0.042, weight: .semibold))
                    .foregroundColor(buttonPressed ? Color.white : Color.black)
            }
        }
        .onChange(of: buttonStatus) { newValue in
            if newValue != buttonName {
                self.buttonPressed = false
            }
        }
    }
}
