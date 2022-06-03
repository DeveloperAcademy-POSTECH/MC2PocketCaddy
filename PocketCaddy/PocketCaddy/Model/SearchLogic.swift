//
//  SearchLogic.swift
//  PocketCaddy
//
//  Created by LeeJaehoon on 2022/06/03.
//

import Foundation
import SwiftUI

struct SearchLogic {
    var jsonDataManager: JsonDataManager
    init() {
        jsonDataManager = JsonDataManager.jsonDataManager
    }
    
    mutating func searchClub(location: String, dxMin: Int?, dxMax: Int?) -> ClubModel? {
        for index in 0 ..< jsonDataManager.clubData.count{
            if location != "Fairway & Rough" && jsonDataManager.clubData[index].location == location {
                return jsonDataManager.clubData[index]
            } else if location == "Fairway & Rough" && jsonDataManager.clubData[index].location == location {
                if let dxMinTemp = dxMin, let dxMaxTemp = dxMax {
                    if dxMinTemp <= jsonDataManager.clubData[index].distance && jsonDataManager.clubData[index].distance < dxMaxTemp {
                        return jsonDataManager.clubData[index]
                    }
                }
            }
        }
        return nil
    }
}
