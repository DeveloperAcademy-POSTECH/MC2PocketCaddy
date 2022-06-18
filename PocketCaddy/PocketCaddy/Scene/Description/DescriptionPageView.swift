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
    
    var body: some View {
        ZStack{
            Color.backgroundWhite
                .ignoresSafeArea()

            VStack {
//                CustomBackButtonGoBack()

            TabView () {                    
                    ForEach(clubDataManager.selectedClub, id: \.?.name) { clubModel in
                        DescriptionSingleView(selectedClub: clubModel, isViewActive: $goBack)
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

extension Image {
    static let cutBackground = Image("CutBackground")
    static let arButton = Image("ARButton")
    static let category = Image("Category")
    static let location = Image("Location")
    static let distance = Image("Distance")
}
