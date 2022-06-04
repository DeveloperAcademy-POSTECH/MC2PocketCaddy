//
//  JsonDataManager.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/02.
//

import Foundation

class JsonDataManager: ObservableObject {
    static var jsonDataManager = JsonDataManager()
    @Published var clubData: [ClubModel] = []
    @Published var selectedClub: ClubModel = ClubModel(category: "", location: "", name: "", subName: "", length: 0, distance: 0, loft: 0, description: "")
    
    init() {
        self.getClubData()
    }

    func getClubData() {
        guard let path = Bundle.main.path(forResource: "Club", ofType: "json") else {
            return
        }
        guard let clubJson = try? String(contentsOfFile: path) else {
            return
        }

        let decoder = JSONDecoder()
        let data = clubJson.data(using: .utf8)

        guard let data = data,
              let clubs = try? decoder.decode([ClubModel].self, from: data) else {
            return
        }
        self.clubData = clubs
    }
    
    func searchClub(location: String, selectedDistance: Distance) {
        let dxMin: Int?
        let dxMax: Int?
        
        switch selectedDistance {
        case .zero:
            dxMin = 0
            dxMax = 49
        case .fifty:
            dxMin = 50
            dxMax = 99
        case .hundred:
            dxMin = 100
            dxMax = 149
        case .hundredFifty:
            dxMin = 150
            dxMax = 199
        case .twoHundred:
            dxMin = 200
            dxMax = 299
        case .threeHundred:
            dxMin = 300
            dxMax = 500
        }
        
        for index in 0 ..< clubData.count{
            if location != "Fairway & Rough" && clubData[index].location == location {
                selectedClub = clubData[index]
            } else if location == "Fairway & Rough" && clubData[index].location == location {
                if let dxMinTemp = dxMin, let dxMaxTemp = dxMax {
                    if dxMinTemp <= clubData[index].distance && clubData[index].distance < dxMaxTemp {
                        selectedClub = clubData[index]
                    }
                }
            }
        }
    }
}
