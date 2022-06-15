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
    @Published var selectedAppearance = false
    var searchEtc: [String: String] =
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
        self.updateSearchEtc()
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
    
    func updateSearchEtc() {
        
        for club in self.clubData {
            searchEtc[club.name]?.append(String(club.category.rawValue + club.subName + club.name).components(separatedBy: [" "]).joined().lowercased())
            
            if let searchEtcStr = searchEtc[club.name] {
                searchEtc[club.name] = separateKor(str: searchEtcStr)
            }
        }
        
    }
    
    // 초중종성 분리
    func separateKor(str: String) -> String {
        let cho: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ",
                             "ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        let joong: [String] = ["ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ",
                               "ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"]
        let jong: [String] = ["","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ","ㄻ","ㄼ",
                              "ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ","ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        
        var separatedStr: String = ""
        
        for char in str {
            let char = String(char)
            var charUniNo = UnicodeScalar(char)!.value
            
            // 가 ~ 힣 사이
            if charUniNo >= 44032 && charUniNo <= 55203 {
                
                // 초중종 separatedStr에 추가
                
                charUniNo = charUniNo - 44032
                
                separatedStr.append(cho[Int(charUniNo / (21 * 28))])
                separatedStr.append(joong[Int((charUniNo % (21 * 28)) / 28)])
                separatedStr.append(jong[Int((charUniNo % (21 * 28)) % 28)])
                
            } else {
                // 한글아님 바로 separatedStr에 추가
                separatedStr.append(char)
            }
        }
        
        return separatedStr
    }
    
    func findClubsByWord(word: String) {
        var clubsTemp: [ClubModel] = []
        
        var wordTemp: String = word.components(separatedBy: [" "]).joined().lowercased()
        wordTemp = separateKor(str: wordTemp)

        
        // 검색어 없음. 모든클럽 출력
        if wordTemp == "" {
            self.selectedClub = self.clubData
            return
        }
        
        for club in self.clubData {
            guard let searchEtc = searchEtc[club.name] else { return }
            
            if searchEtc.contains(wordTemp) {
                clubsTemp.append(club)
            }
        }
        
        self.selectedClub = clubsTemp
    } //: FUNC
    
    
    //✅ SelectionView로 부터 전달받은 location, distance 파라미터를 핸들링합니다.
    //✅ 위치, 거리에 적합한 채 정보를 selectedClub 변수에 할당합니다.
    func searchClub(location: Location, selectedDistance: Int) {
        var temp: [Int: Int] = [:]
        
        self.selectedClub = []
        
        for index in 0..<self.clubData.count {
            // 위치가 Teeing Ground, Green, Bunker인 경우
            if location != Location.fairwayAndRough && self.clubData[index].location == location {
                self.selectedClub.append(self.clubData[index])
                
                // Fairway and Rough 위치와 Distance 정보가 할당된 경우
            } else if location == Location.fairwayAndRough && self.clubData[index].location == location {
                temp[index] = abs(self.clubData[index].distance! - selectedDistance)
            }
        }
        
        if location == .fairwayAndRough {
            let temp2 = temp.sorted { $0.1 < $1.1 }
            
            for (k, v) in temp2 {
                self.selectedClub.append(self.clubData[k])
                if self.selectedClub.count >= 3 {
                    break
                }
            }
        }
    }// searchClub
    
}
