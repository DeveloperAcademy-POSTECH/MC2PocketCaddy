//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack {
            // Title and name stack
            Group {
                // Title
                Text("CLUB")
                    .font(.system(
                        size: 45,
                        weight: .heavy,
                        design: .default)
                    )
                
                // Name of the selected club
                Text("Cateogry Here")
                    .font(.system(
                        size: 25,
                        weight: .medium)
                    )
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Sample Image
            Image(systemName: "pencil")
                .resizable()
                .frame(width: 300, height: 300)

            //Club details
            Title(title: "Name")

            // Horizontal Separator
            HorizontalSeparator()
            
            // Distance, Loft, Length info
            HStack (spacing: 100) {
                InfoComponent(title: "Length")
                InfoComponent(title: "Distance")
                InfoComponent(title: "Loft")
            }
            
            HorizontalSeparator()
            
            Group {
                Title(title: "Description")
                
                Text("Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World ")
                    .padding(.horizontal, 15)
            }

        }// VStack
    }// body
}// DescriptionView

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}

struct HorizontalSeparator: View {
    var body: some View {
        Rectangle()
            .frame(width: 350, height: 1)
            .foregroundColor(.gray)
            .padding(.vertical, 5)
    }
}

struct InfoComponent: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 17, weight: .medium))
            Text("100")
        }
    }
}

struct Title: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 20, weight: .medium))
    }
}
