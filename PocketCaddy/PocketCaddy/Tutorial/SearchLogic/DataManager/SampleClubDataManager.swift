//
//  JsonDataManager.swift
//  PocketCaddy
//
//  Created by 김상현, Theodore on 2022/06/11.
//

import Foundation

class SampleClubDataManager: ObservableObject {
    @Published var clubData: [ClubModel] = []
    @Published var selectedClub: ClubModel = ClubModel(
        category: .wood,
        location: .fairwayAndRough,
        name: "Wood 1",
        subName: "Driver",
        length: 43.5,
        distance: 220,
        loft: 12,
        description: "드라이버는 클럽의 헤드가 머리보다 앞에서 친다는 느낌으로 스윙하기"
    )

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
    
    //✅ func searchClub will return a ClubModel so that the description view is able to release relevant data
    func searchClub(location: Location, selectedDistance: Int) -> ClubModel? {
        // ✅ This function receives location data with Location type
        // ✅ and Integer data for selectedsDistance parameter
        
        for clubData in self.clubData {
            // ✅ When a user selected Teeing Ground, Green, or Bunker
            if location != Location.fairwayAndRough && clubData.location == location {
                selectedClub = clubData
                return selectedClub
            
            // ✅ When a user selected Fairway and Rough with Specific Distance
            } else if location == Location.fairwayAndRough && clubData.location == location {

                // ✅ Cases that the given distance ends with 0
                if selectedDistance % 10 == 0 {
                    if selectedDistance == clubData.distance {
                        selectedClub = clubData
                        return selectedClub
                    }
                // ✅ Cases that the given distance ends with 5
                } else {
                    let newDistance = selectedDistance - 5
                    if newDistance == clubData.distance {
                        selectedClub = clubData
                        return selectedClub
                    }
                }

            }
        }// for clubData in self.clubData
        return nil
        
    }// searchClub
    
}// SampleClubDataManager
