//
//  PocketCaddyApp.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/05/31.
//

import SwiftUI

@main
struct PocketCaddyApp: App {
    @StateObject var jsonDataManager: ClubDataManager =  ClubDataManager()
    
    var body: some Scene {
        WindowGroup {
//            MapView()
            SampleSelectionView()
                .environmentObject(jsonDataManager)
            //            SampleView()
        }
    }
}
