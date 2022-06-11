//
//  JsonDataManager.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/02.
//

import Foundation

class ClubDataManager: ObservableObject {
    @Published var clubData: [ClubModel] = []
    @Published var selectedClub: [ClubModel?] = []
    let searchEtc: [String: String] =
    [
        "1-Wood": "1번우드1번드라이버",
        "2-Wood": "2번우드2번브라시",
        "3-Wood": "3번우드3번스푼",
        "4-Wood": "4번우드4번버피",
        "5-Wood": "5번우드5번클리크",
        "1-Iron": "1번아이언1번드라이빙아이언",
        "2-Iron": "2번아이언2번미드아이언",
        "3-Iron": "3번아이언3번미드매쉬",
        "4-Iron": "4번아이언4번매쉬아이언",
        "5-Iron": "5번아이언5번매쉬",
        "6-Iron": "6번아이언6번스페이드매쉬",
        "7-Iron": "7번아이언7번매쉬닉블릭",
        "8-Iron": "8번아이언8번피쳐",
        "9-Iron": "9번아이언9번닉블릭",
        "Pitching Wedge": "피칭웨지",
        "Approach Wedge": "어프로치웨지갭웨지",
        "Sand Wedge": "샌드웨지",
        "Lob Wedge": "로브웨지",
        "Putter": "퍼터"
    ]
    
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
                selectedClub.append(clubData)
                
            } else if location == Location.fairwayAndRough && clubData.location == location {
                
                if let dxMinTemp = dxMin, let dxMaxTemp = dxMax {
                    guard let distance = clubData.distance else { break }
                    
                    if dxMinTemp <= distance && distance < dxMaxTemp {
                        selectedClub.append(clubData)
                    }
                }
                
            }
        }
    } //: FUNC
    
    func findClubsByWord(word: String) {
        var clubsTemp: [ClubModel] = []
        var clubInfoStr: String = ""
        
        let wordTemp: String = word.components(separatedBy: [" "]).joined().lowercased()
        
        // 검색어 없음. 모든클럽 출력
        if wordTemp == "" {
            self.selectedClub = self.clubData
            return
        }
        
        for club in self.clubData {
            guard let searchEtc = searchEtc[club.name] else { return }
            
            clubInfoStr = String(club.category.rawValue + club.subName + club.name + searchEtc).components(separatedBy: [" "]).joined().lowercased()
            
            if clubInfoStr.contains(wordTemp) {
                clubsTemp.append(club)
            }
        }
        
        self.selectedClub = clubsTemp
    } //: FUNC

}
