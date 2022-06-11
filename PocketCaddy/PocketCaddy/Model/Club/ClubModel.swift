//
//  ClubModel.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

struct ClubModel: Codable {
    let category: ClubCategory
    let location: Location
    let name: String // ID
    let subName: String
    let length: Double
    let distance: Int?
    let loft: Int
    let description: String
}

enum ClubCategory: String, Codable {
    case wood = "Wood"
    case iron = "Iron"
    case wedge = "Wedge"
    case putter = "Putter"
}

enum Location: String, Codable, CaseIterable {
    case teeingGround = "teeing ground"
    case bunker = "bunker"
    case green = "green"
    case fairwayAndRough = "fairway & rough"
}
