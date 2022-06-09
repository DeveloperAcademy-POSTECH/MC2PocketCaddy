//
//  DescriptionView.swift
//  PocketCaddy
//
//  Created by 유정인, 이현상 on 2022/05/31.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var clubDataManager : ClubDataManager
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color.greenBackground
            
            VStack {
                Image.cutBackground
                    .resizable()
                    .frame(width: screenWidth, height: screenHeight * 0.6, alignment: .center)

                Spacer()
            }
            
            VStack(alignment: .leading) {
                Button {

                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .foregroundColor(.greenForeground)
                }.frame(width: 26, height: 26)
                .padding([.top, .leading])
                
                VStack {
                    Spacer()
                        .frame(height: 30)
                                    
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text("1-Wood")
                            .bold()
                            .font(.system(size: 40))
                            .foregroundColor(.greenForeground)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        
                        Text("드라이버는 클럽의 헤드가 머리보다\n앞에서 친다는 느낌으로 스윙하기")
                            .font(.system(size: 16))
                            .foregroundColor(.greenForeground)
                    }.frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                }.frame(width: .infinity, height: screenHeight * 0.55, alignment: .top)
                
                VStack(spacing: 20) {
                    HStack {
                        Image.category
                        
                        Spacer()
                        
                        Text("Wood")
                            .foregroundColor(.white)
                    }.frame(width: screenWidth * 0.7)
     
                    HStack {
                        Image.location
                        
                        Spacer()
                        
                        Text("Teeing Ground")
                            .foregroundColor(.white)
                    }.frame(width: screenWidth * 0.7)

                    HStack {
                        Image.distance
                        
                        Spacer()
                        
                        Text("200m")
                            .foregroundColor(.white)
                    }.frame(width: screenWidth * 0.7)
                }.frame(width: screenWidth, height: screenHeight * 0.3)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//            VStack {
//                HStack {
//                    Button {
//
//                    } label: {
//                        Image(systemName: "arrow.backward")
//                            .resizable()
//                            .foregroundColor(.greenForeground)
//
//                    }.frame(width: 26, height: 26)
//                    .padding([.top, .leading])
//
//                    Spacer()
//                }
//
//                HStack {
//                    Text("1-Wood")
//                        .bold()
//                        .font(.system(size: 40))
//                        .foregroundColor(.greenForeground)
//
//                    Spacer()
//                }
//                .padding([.top, .leading], 30.0)
//
//                HStack {
//                    Text("드라이버는 클럽의 헤드가 머리보다\n앞에서 친다는 느낌으로 스윙하기")
//                        .font(.system(size: 16))
//                        .foregroundColor(.greenForeground)
//
//                    Spacer()
//                }.padding(.leading, 30.0)
//
//
//                Spacer()
//            }.frame(width: .infinity, height: screenHeight * 0.6, alignment: .top)
//
//            VStack(spacing: 20) {
//                Spacer()
//                    .frame(height: screenHeight * 0.5)
//
//                HStack {
//                    Image.category
//
//                    Spacer()
//
//                    Text("Wood")
//                        .foregroundColor(.white)
//                }.frame(width: screenWidth * 0.7)
//
//                HStack {
//                    Image.location
//
//                    Spacer()
//
//                    Text("Teeing Ground")
//                        .foregroundColor(.white)
//                }.frame(width: screenWidth * 0.7)
//
//                HStack {
//                    Image.distance
//
//                    Spacer()
//
//                    Text("200m")
//                        .foregroundColor(.white)
//                }.frame(width: screenWidth * 0.7)
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
           
            
        }
    }
}

extension Image {
    static let cutBackground = Image("CutBackground")
    static let category = Image("Category")
    static let location = Image("Location")
    static let distance = Image("Distance")
}
//        VStack {
//            // green rectangle components
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 310, height: 430)
//                    .foregroundColor(.secondaryGreen)
//
//                // club image and title
//                VStack {
//                    HStack(alignment: .bottom, spacing: -90) {
//                        VStack(alignment: .leading) {
//                            Text(clubDataManager.selectedClub.name)
//                                .foregroundColor(.white)
//                                .font(.system(size: 40, weight: .bold))
//
//                            Capsule()
//                                .foregroundColor(.white)
//                                .frame(width: 90, height: 35)
//                                .overlay(
//                                    Text(clubDataManager.selectedClub.subName)
//                                        .foregroundColor(.secondaryGreen)
//                                        .fontWeight(.bold)
//                                )
//                        }
//                        Image("DriverClubSample")
//                    }
//                    .offset(x: 0, y: -50)
//
//                    Rectangle()
//                        .frame(width: 290, height: 0.5, alignment: .center)
//                        .foregroundColor(.primaryWhite)
//
//                    HStack (spacing: 40) {
//                        VStack {
//                            Text("Length")
//                                .font(.system(size: 14, weight: .medium))
//                                .foregroundColor(.white)
//
//                            Spacer()
//
//                            HStack(spacing: 5) {
//                                Text("\(clubDataManager.selectedClub.length.truncateDoubleTail())")
//                                    .font(.system(size: 20, weight: .bold))
//                                    .foregroundColor(.white)
//
//                                Text("cm")
//                                    .foregroundColor(.white)
//
//                            }
//                        }
//                        .padding(.vertical, 50)
//
//                        InfoComponent(title: "Loft", otherValue: "\(clubDataManager.selectedClub.loft)", unitValue: "°")
//                        InfoComponent(title: "Distance", otherValue: clubDataManager.selectedClub.distance!.description, unitValue: "m")
//                    }
//                    .offset(x: 0, y: -30)
//                }
//            }
//            Spacer()
//
//            // gray rectangle components
//            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 310, height: 120)
//                    .foregroundColor(.grayBackground)
//
//                VStack(alignment: .leading, spacing: 15) {
//                    Text("💡Tip")
//                        .font(.system(size: 22))
//
//                    Text("\(clubDataManager.selectedClub.description)")
//                        .font(.system(size: 16))
//                }
//                .padding(.horizontal, 50)
//            }
//
//        }
//        .padding(.vertical, 90)

        
        
        
//struct InfoComponent: View {
//    let title: String
//    var otherValue: String
//    var unitValue: String
//
//    var body: some View {
//        VStack {
//            Text(title)
//                .font(.system(size: 14, weight: .medium))
//                .foregroundColor(.white)
//
//            Spacer()
//
//            HStack(spacing: 5) {
//                Text(otherValue)
//                    .font(.system(size: 20, weight: .bold))
//                    .foregroundColor(.white)
//
//                Text(unitValue)
//                    .foregroundColor(.white)
//            }
//
//        }
//        .padding(.vertical, 50)
//    }
//}
//
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
