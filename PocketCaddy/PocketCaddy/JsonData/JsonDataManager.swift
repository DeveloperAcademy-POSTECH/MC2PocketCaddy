//
//  JsonDataManager.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/02.
//

import Foundation

struct ClubData: Codable {
    //let userLock: [String]
    let clubData: [String:String]
}

class JsonDataManager {
    static let jsonDataManager = JsonDataManager()
    var clubData = ["":""]
    
    func getJsonData() {
        guard let path = Bundle.main.path(forResource: "SampleData", ofType: "json") else {
            return
        }
        guard let clubJson = try? String(contentsOfFile: path) else {
            return
        }

        let decoder = JSONDecoder()
        let data = clubJson.data(using: .utf8)

        guard let data = data,
           let clubs = try? decoder.decode(ClubData.self, from: data) else {
            return
        }
        self.clubData = clubs.clubData
    }
}
