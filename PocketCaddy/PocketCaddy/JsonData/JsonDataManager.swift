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
}
