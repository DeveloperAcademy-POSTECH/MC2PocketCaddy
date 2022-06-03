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
    func searchClub(location: String, dxMin: Int?, dxMax: Int?) -> ClubModel? {
        for index in 0 ..< clubData.count{
            if location != "Fairway & Rough" && clubData[index].location == location {
                return clubData[index]
            } else if location == "Fairway & Rough" && clubData[index].location == location {
                if let dxMinTemp = dxMin, let dxMaxTemp = dxMax {
                    if dxMinTemp <= clubData[index].distance && clubData[index].distance < dxMaxTemp {
                        return clubData[index]
                    }
                }
            }
        }
        return nil
    }
}
