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
    @Published var selectedClub: ClubModel = ClubModel(category: "wood", location: "teeing ground", name: "1번 우드", subName: "subname", length: 43.5, distance: 220, loft: 12, description: "'드라이버(Driver)'라고 불림. 드라이버도 우드의 한 종류이지만 티샷 외에는 사용할 수 없다는 점 때문에 우드라고 부르지 않고 '드라이버'라고 부름. 가장 긴 샤프트와 가장 큰 헤드가 특성")

    
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
