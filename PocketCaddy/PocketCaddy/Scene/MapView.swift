//
//  MapView.swift
//  PocketCaddy
//
//  Created by Byeon jinha on 2022/05/31.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        HStack{
            VStack{
                
                ForEach(0..<4){ i in
                    Button(action: {}){Image("GolfDriver").resizable().frame(width: 100, height: 100, alignment: .trailing).padding().border(.red)
                    }
                }
            }
            Image("land").resizable().frame(width: 100, height: 500).padding(20).border(.red)
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
