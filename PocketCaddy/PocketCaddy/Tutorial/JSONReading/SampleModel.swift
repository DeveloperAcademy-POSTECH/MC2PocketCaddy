//
//  SampleStruct.swift
//  PocketCaddy
//
//  Created by Theodore on 2022/06/01.
//

import Foundation

// JSON 내용을 적용할 struct 예시 입니다.
// 데이터가 저장될 형식(schema, model)이며, json 데이터의 형식에 맞게 struct를 작성해야 합니다.
// 각각의 JSON 데이터와 struct의 양식 타입을 동일하게 설정해주세요. 그렇지 않으면 데이터가 표시되지 않습니다. (fatal error 발생)

/* SampleJSON의 데이터 타입은 아래와 같습니다.
 {
     "name": "Badger", (✅ String)
     "age": 20, (✅ Int)
     "height": 185.8, (✅ Double)
     "items": [
         {
             "name": "iphone",
             "price": 100
         },
         {
             "name": "iMac",
             "price": 300
         },
         {
             "name": "AppleCar",
             "price": 500
         },
     ] (✅ 이름과 가격 정보가 있는 아이템의 배열 -> Item이라는 struct를 새로 만들어 처리)
 }
 */

struct SampleModel: Codable {
    
    // https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
    // Codable 타입은 CodingKeys 라고 하는 특별한 enum을 선언할 수 있습니다. CodingKeys는 CodingKey 프로토콜을 준수합니다.
    // 해당 enum이 존재할 시, enum에 포함된 모든 case들은 Codable 타입이 인코딩(encoding) 혹은 디코딩(decoding) 될 떄 반드시 포함되어야 할 조건으로 활용됩니다.
    // case의 명칭은 codable 타입 내 변수의 명칭과 동일해야 합니다.
     
    // enum (enumeration) : https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
    // protocol : https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
    enum CodingKeys: CodingKey {
        case name
        case age
        case height
        case items
    }
    
    let name: String
    let age: Int
    let height: Double
    let items: [Item]
}

// 아이템의 경우 이름과 가격 정보가 동시에 처리되어야 하기에 편의상 새로운 struct를 만들어 진행하고자 함
struct Item: Codable, Identifiable {

    enum CodingKeys: CodingKey {
        case name
        case price
    }
    
    var id = UUID()
    let name: String
    let price: Int
}
