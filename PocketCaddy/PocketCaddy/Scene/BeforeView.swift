//
//  BeforeView.swift
//  PocketCaddy
//
//  Created by 유정인 on 2022/06/04.
//

//import SwiftUI
//
//struct BeforeView: View {
//    @EnvironmentObject var jsonDataManager : JsonDataManager
//    
//    var body: some View {
//        VStack {
//            Text(jsonDataManager.selectedClub.category)
//                .font(.system(
//                    size: 25,
//                    weight: .medium)
//                )
//            .padding(.horizontal, 20)
//            .frame(maxWidth: .infinity, alignment: .leading)
//
//            // Sample Image
//            Image(systemName: "pencil")
//                .resizable()
//                .frame(width: 300, height: 300)
//
//            //Club details
//            Title(title: jsonDataManager.selectedClub.name)
//
//            // Distance, Loft, Length info
//            HStack (spacing: 100) {
//                VStack {
//                    Text("Length")
//                        .font(.system(size: 17, weight: .medium))
//                    Text("\(jsonDataManager.selectedClub.length.truncateDoubleTail())")
//                }
//
//                InfoComponent(title: "Distance", otherValue: jsonDataManager.selectedClub.distance)
//                InfoComponent(title: "Loft", otherValue: jsonDataManager.selectedClub.loft)
//            }
//
//            Group {
//                Title(title: "Description")
//
//                Text(jsonDataManager.selectedClub.description)
//                    .padding(.horizontal, 15)
//            }
//        }// VStack
//    }
//}
//
////struct HorizontalSeparator: View {
////    var body: some View {
////        Rectangle()
////            .frame(width: 350, height: 1)
////            .foregroundColor(.gray)
////            .padding(.vertical, 5)
////    }
////}
//
//struct InfoComponent: View {
//    
//    let title: String
//    var otherValue: Int
//    
//    var body: some View {
//        VStack {
//            Text(title)
//                .font(.system(size: 17, weight: .medium))
//            Text("\(otherValue)")
//        }
//    }
//}
//
//struct Title: View {
//    
//    let title: String
//    
//    var body: some View {
//        Text(title)
//            .padding(.horizontal, 20)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .font(.system(size: 20, weight: .medium))
//    }
//}
//
//extension Double {
//    func truncateDoubleTail() -> String {
//        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
//        guard let resultVal = numberFormatter.string(for: NSNumber(value: self)) else {return ""}
//        
//        return resultVal
//    }
//}
//
//
//struct BeforeView_Previews: PreviewProvider {
//    static var previews: some View {
//        BeforeView()
//    }
//}
