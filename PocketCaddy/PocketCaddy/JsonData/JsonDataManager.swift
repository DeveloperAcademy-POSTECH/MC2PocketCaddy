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
    @Published var selectedClub: ClubModel = ClubModel(category: "wood", location: "teeing ground", name: "Wood 1", subName: "Driver", length: 43.5, distance: 220, loft: 12, description: "드라이버는 클럽의 헤드가 머리보다 앞에서 친다는 느낌으로 스윙하기")

    
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
