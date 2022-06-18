//
//  HomeSelection.swift
//  PocketCaddy
//
//  Created by Hyeon-sang Lee on 2022/06/16.
//

import SwiftUI

struct HomeSelection: View {
    @State var isAllClubActive: Bool = false
    @State var isLocationAndDistanceActive: Bool = false
    @GestureState private var dragOffsetHomeView = CGSize.zero

    var body: some View {
        if isAllClubActive == true {
            SearchView(isAllClubActive: $isAllClubActive)
                .navigationBarHidden(true)
                .transition(.opacity)
                .contentShape(Rectangle())
                .gesture(DragGesture().updating($dragOffsetHomeView) { (value, state, transaction) in
                    if (value.startLocation.x < 30 && value.translation.width > 100) {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.isAllClubActive = false
                            }
                        }
                    }
                })
            
        } else if isLocationAndDistanceActive == true {
            SelectionView(isLocationAndDistanceActive: $isLocationAndDistanceActive)
                .navigationBarHidden(true)
                .transition(.opacity)
                .contentShape(Rectangle())
                .gesture(DragGesture().updating($dragOffsetHomeView) { (value, state, transaction) in
                    if (value.startLocation.x < 30 && value.translation.width > 100) {
                        DispatchQueue.main.async {
                            withAnimation {
                                self.isLocationAndDistanceActive = false

                            }
                        }
                    }
                })
            
        } else {
            HomeView(
                isAllClubActive: $isAllClubActive,
                isLocationAndDistanceActive: $isLocationAndDistanceActive
            )
        }
        
    }// body
}// HomeSelection

struct HomeSelection_Previews: PreviewProvider {
    static var previews: some View {
        HomeSelection()
    }
}
