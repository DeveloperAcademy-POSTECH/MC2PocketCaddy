//
//  SampleReader.swift
//  PocketCaddy
//
//  Created by Theodore on 2022/06/01.
//

import Foundation

struct SampleReader {
    var json = [SampleModel]()

    init() {
        load()
    }

    // Read the sample JSON file
    mutating func load() {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json")
        else {
            // https://stackoverflow.com/questions/41775563/bundle-main-pathforresourceoftypeindirectory-returns-nil
            // Check the link if this error message pops in the console.
            print("JSON file not found")
            return
        }

        let data = try? Data(contentsOf: url)
        let results = try? JSONDecoder().decode([SampleModel].self, from: data!)

        self.json = results!
    }
}
