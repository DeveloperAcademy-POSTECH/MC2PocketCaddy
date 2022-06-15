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
            CustomBackButton(presentationMode: presentationMode)
            
            // Title
            HStack {
                VStack(alignment: .leading) {
                    Text("현재 \(Text("공").foregroundColor(.primaryGreen))은\n어느 위치에 있나요?")
                        .font(.system(size: Screen.width * 0.09, weight: .bold))
                        .fixedSize(horizontal: true, vertical: true)
                        .padding(.bottom, Screen.width * 0.005)
                    
                    Text("공이 위치한 구역과 목표 거리를 입력해주세요 :)")
                        .foregroundColor(.gray)
                        .font(.system(size: Screen.width * 0.038))
                        .fixedSize(horizontal: true, vertical: true)
                }
                .padding(.bottom, Screen.height * 0.04)
                
                Spacer()
            }
            
            // Location Section
            HStack {
                Text("Location")
                    .font(Font.system(size: Screen.width * 0.07, weight: .bold))
                Spacer()
                // MapView()로 이동
                Button(action: {
                    clubDataManager.selectedAppearance = false
                    goToMapView = true
                }){
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.black)
                }
                
                NavigationLink(destination: MapView().navigationBarHidden(true), isActive: $goToMapView ) {
                }
                
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
                .frame(height: Screen.width * 0.04)
            
            switch currentButtonStatus {
            case .fairwayAndRough:
                if value == 0 {
                    Text("선택 완료")
                        .foregroundColor(.white)
                        .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                        .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
                        .background{
                            RoundedRectangle(cornerRadius: Screen.height)
                                .foregroundColor(Color.backgroundWhite)
                        }
                } else {
                    NavigationLink(destination: DescriptionPageView().navigationBarHidden(true)){
                        Text("선택 완료")
                            .foregroundColor(.white)
                            .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                            .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
                            .background {
                                LinearGradient(gradient: Gradient(colors: [.secondaryGreen, .primaryGreen]), startPoint: .leading, endPoint: .trailing)
                                    .cornerRadius(Screen.height)
                            }
                    }
                }
            default:
                if currentButtonStatus == nil {
                    Text("선택 완료")
                        .foregroundColor(.white)
                        .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                        .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
                        .background{
                            RoundedRectangle(cornerRadius: Screen.height)
                                .foregroundColor(Color.backgroundWhite)
                        }
                } else {
                    NavigationLink(destination: DescriptionPageView().navigationBarHidden(true)){
                        Text("선택 완료")
                            .foregroundColor(.white)
                            .font(Font.system(size: Screen.width * 0.045, weight: .bold))
                            .frame(width: Screen.width * 0.3, height: Screen.height * 0.06)
                            .background {
                                LinearGradient(gradient: Gradient(colors: [.secondaryGreen, .primaryGreen]), startPoint: .leading, endPoint: .trailing)
                                    .cornerRadius(Screen.height)
                            }
                    }
                }
            }
        }
          .frame(maxWidth: Screen.width, maxHeight: Screen.height)
          // 전체 뷰에 대한 padding
          .padding(.horizontal, Screen.width * 0.06)
          .padding(.vertical, Screen.width * 0.08)
          .navigationBarHidden(true)
    }
    
    // MARK: 선택 완료 버튼 함수 처리
    private func searchClub() {
        guard let location = currentButtonStatus else { return }
        self.clubDataManager.searchClub(location: location, selectedDistance: Int(value))
    }
}

/// Location 선택 버튼
struct LocationRectangle: View {
    @State var buttonPressed: Bool = false
    @Binding var buttonStatus: Location?
    
    var buttonName: Location
    var buttonImage: String
    
    var body: some View {
        Button {
            if self.buttonPressed {
                self.buttonPressed = false
                buttonStatus = nil
            } else {
                self.buttonPressed = true
                buttonStatus = buttonName
            }
        } label: {
            ZStack {
                Image(buttonImage)
                    .resizable()
                    .frame(width: Screen.width * 0.43, height: Screen.height * 0.12)
                    .cornerRadius(8)
                    .opacity(buttonPressed ? 1 : 0.3)
                Text(buttonName.rawValue)
                    .font(Font.system(size: Screen.width * 0.042, weight: .bold))
                    .foregroundColor(buttonPressed ? Color.white : Color.black)
            }
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
