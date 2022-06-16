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
    
    var body: some View {
        if isAllClubActive == true {
            SearchView(isAllClubActive: $isAllClubActive)
                .navigationBarHidden(true)
                .transition(.opacity)
            
        } else if isLocationAndDistanceActive == true {
            SelectionView(isLocationAndDistanceActive: $isLocationAndDistanceActive)
                .navigationBarHidden(true)
                .transition(.opacity)
            
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
