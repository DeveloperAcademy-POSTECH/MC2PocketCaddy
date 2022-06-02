//
//  SampleView.swift
//  PocketCaddy
//
//  Created by Theodore on 2022/06/01.
//

import SwiftUI

struct SampleView: View {
    
    var sampleData = SampleReader()
    
    var body: some View {
        
        let data = sampleData.json[0]
        
        VStack {
            Text(data.name)
            Text("\(data.age)")
            Text("\(data.height)")
            
            HStack {
                ForEach (data.items) { item in
                    Text(item.name)
                }
            }// HStack
            
        }// VStack
    }// body
}// SampleView

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
