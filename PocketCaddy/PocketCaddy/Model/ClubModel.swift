//
//  ClubModel.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

struct ClubModel: Codable {
    let category: String
    let location: String
    let name: String // ID
    let subName: String
    let length: Double
    let distance: Int
    let loft: Int
    let description: String
}

enum ClubCategory: Codable {
    case wood
    case iron
    case wedge
    case putter
}
