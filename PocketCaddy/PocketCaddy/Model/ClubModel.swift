//
//  ClubModel.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/05/31.
//

import Foundation

struct ClubModel {
    let name: String
    let category: ClubCategory
    let distance: Int
    let loft: Int
}

enum ClubCategory {
    case wood
    case iron
    case wedge
    case putter
}
