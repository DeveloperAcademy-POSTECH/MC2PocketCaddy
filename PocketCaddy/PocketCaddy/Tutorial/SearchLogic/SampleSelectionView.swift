//
//  SelectionView.swift
//  PocketCaddy
//
//  Created by 유정인 on 2022/06/09.
//
//  Last Refactoring, Theodore, 10 June 2022

import SwiftUI

// 🔥 - Section Indicator
// ✅ - Things I changed
// ⚡️ - Code needed
struct SampleSelectionView: View {
    // State Variables
    @State var isEditing: Bool = true
    @State var distance: Double = 0
    @State var currentButtonStatus: Location? = nil
    
    // Variables
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Grid Shape Setting
    let minDistance: Double = 0.0
    let maxDistance: Double = 210.0
    
    // body View
    var body: some View {
        
        // Selection Button Setting
        let locationButtonArray: [SampleLocationRectangle] = [
            SampleLocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .fairwayAndRough, buttonImage: "FairwayRough"),
            SampleLocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .teeingGround, buttonImage: "TeeingGround"),
            SampleLocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .bunker, buttonImage: "Bunker"),
            SampleLocationRectangle(buttonStatus: $currentButtonStatus, buttonName: .green, buttonImage: "Green")
        ]
        
        NavigationView {
            // 🔥 전체뷰
            // ✅ Previous VStack & HStack was removed
            VStack {
                // 🔥 VStack (Title "현재 공은 어느 위치에 있나요?)
                // ✅ Set multiline text, and UIScreen info as variables
                VStack(alignment: .leading) {
                    Text("현재 \(Text("공").foregroundColor(.thirdGreen))은\n어느 위치에 있나요?")
                        .frame(width: 300, height: 100, alignment: .leading)
                        .font(.system(size: screenWidth * 0.09, weight: .bold))
                    
                    Text("공이 위치한 구역과 목표 거리를 입력해주세요 :)")
                        .foregroundColor(.fontGray)
                        .font(.system(size: screenWidth * 0.038))
                    
                }
                .padding(.bottom, screenHeight * 0.03)
                
                // 🔥 Location Section - HStack for the Location section title setting
                HStack {
                    Text("Location")
                        .font(Font.system(size: screenWidth * 0.07, weight: .bold))
                    
                    Spacer()
                    
                    // ✅ MapView()로 이동 - Button to NavigationLink
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundColor(.black)
                    }
                }
                
                // 🔥 Location 선택 버튼
                // ✅ HStack to LazyVGrid - Users have to press only one button without multiple selections
                LazyVGrid(columns: columns) {
                    ForEach(0..<locationButtonArray.count, id: \.self) {index in
                        locationButtonArray[index]
                            .padding(index % 2 == 0 ? .trailing : .leading, 25)
                    }
                }
                
                // 🔥 Distance Section
                HStack {
                    Text("Distance")
                        .font(Font.system(size: screenWidth * 0.07, weight: .bold))
                    Spacer()
                }
                .padding(.top, screenHeight * 0.03)
                
                // 🔥 남은 거리 텍스트
                // ✅ Text format
                Text("“목표 거리는 \(Text("\(Int(distance))m").foregroundColor(.primaryGreen))입니다.“")
                    .font(Font.system(size: screenWidth * 0.045, weight: .bold))
                    .padding(.top, 5)
                
                // ✅ Slider format
                Slider(
                    value: $distance,
                    in: minDistance...maxDistance,
                    step: 5
                ) {
                    Text("Distance")
                } minimumValueLabel: {
                    Text("\(Int(minDistance))m")
                } maximumValueLabel: {
                    Text("\(Int(maxDistance))m")
                }
                .accentColor(.primaryGreen)
                
                // 🔥 선택 버튼
                // ✅ Button to NavigationLink
                NavigationLink(destination: SampleDescriptionView(
                    locationInfo: currentButtonStatus != nil ? currentButtonStatus! : .fairwayAndRough,
                    distance: Int(distance)
                )) {
                    Text("선택 완료")
                        .foregroundColor(.white)
                        .font(Font.system(size: screenWidth * 0.045, weight: .bold))
                        .frame(width: screenWidth * 0.3, height: screenHeight * 0.065)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.gradientColorLight, .gradientColorDark]), startPoint: .leading, endPoint: .trailing)
                                .cornerRadius(screenHeight)
                        )
                }
                // ✅ The link remains disabled unless a user select the location info
                .disabled(currentButtonStatus == nil)
                
            }// VStack (Inside of the Navigation View)
            .frame(maxWidth: screenWidth, maxHeight: screenHeight)
            // 전체 뷰에 대한 padding
            .padding([.bottom, .horizontal], 60)
        } //Navigation View
    }// Body
}// SampleSelectionView

//struct SampleSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectionView()
//    }
//}

// 뒤로 가기 버튼 - ✅ Need to be removed
//.navigationBarItems(
//    leading: HStack {
//        Button {
//
//        } label: {
//            Image(systemName: "arrow.left")
//                .font(Font.system(size: UIScreen.main.bounds.width * 0.05, weight: .semibold))
//                .foregroundColor(.thirdGreen)
//        }
//        Spacer()
//    }
//        .padding()
//)
