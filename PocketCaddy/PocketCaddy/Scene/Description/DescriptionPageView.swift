//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionPageView: View {
    @EnvironmentObject var clubDataManager : ClubDataManager
    @State var currentPage: Int = 0
    @Binding var goBack: Bool
    
    @GestureState private var dragOffsetDescriptionPageView = CGSize.zero

    var body: some View {
        ZStack {
            Color.backgroundWhite
                .ignoresSafeArea()

            VStack {
                CustomBackButtonGoBack(isViewActive: $goBack)

            TabView() {
                ForEach(clubDataManager.selectedClub, id: \.?.name) { clubModel in
                    DescriptionSingleView(selectedClub: clubModel, isViewActive: $goBack)

                    } //Foreach

                } // TabView
            } // Vstack
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .contentShape(Rectangle())
            .gesture(DragGesture().updating($dragOffsetDescriptionPageView) { (value, state, transaction) in
                if (value.startLocation.x < 30 && value.translation.width > 100) {
                    // MARK: 아직 이벤트 처리 안넣었음
                }
            }) // gesture
          
        } // Zstack
    } // body
} // DescriptionPageView

extension Image {
    static let cutBackground = Image("CutBackground")
    static let arButton = Image("ARButton")
    static let category = Image("Category")
    static let location = Image("Location")
    static let distance = Image("Distance")
}
