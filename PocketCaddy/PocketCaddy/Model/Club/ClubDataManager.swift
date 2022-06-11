//
//  JsonDataManager.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/02.
//

import Foundation

class ClubDataManager: ObservableObject {
    @Published var clubData: [ClubModel] = []
    @Published var selectedClub: ClubModel = ClubModel(category: .wood, location: .fairwayAndRough, name: "1-Wood", subName: "Driver", length: 43.5, distance: 220, loft: 12, description: "드라이버는 클럽의 헤드가 머리보다 앞에서 친다는 느낌으로 스윙하기")

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
    
    func searchClub(location: Location, selectedDistance: Distance) {
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
        
        for clubData in self.clubData {
            
            if location != Location.fairwayAndRough && clubData.location == location {
                selectedClub = clubData
                
            } else if location == Location.fairwayAndRough && clubData.location == location {
                
                if let dxMinTemp = dxMin, let dxMaxTemp = dxMax {
                    guard let distance = clubData.distance else { break }
                    
                    if dxMinTemp <= distance && distance < dxMaxTemp {
                        selectedClub = clubData
                    }
                }
                
            }
        }
    }
}
