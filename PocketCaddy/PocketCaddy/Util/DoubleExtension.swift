//
//  DoubleExtension.swift
//  PocketCaddy
//
//  Created by 김상현 on 2022/06/06.
//

import Foundation

extension Double {
    func truncateDoubleTail() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let resultVal = numberFormatter.string(for: NSNumber(value: self)) else {return ""}

        return resultVal
    }
}
