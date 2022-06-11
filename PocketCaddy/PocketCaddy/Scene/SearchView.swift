//
//  SearchView.swift
//  PocketCaddy
//
//  Created by LeeJaehoon on 2022/06/11.
//

import SwiftUI

struct SearchView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var clubDataManager: ClubDataManager
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State private var search: String = ""
    @State private var isAnimation: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            Group {
                HStack{
                    Text("정보가 ")
                    Text("궁금한 채")
                    Text("는")
                }
                Text("무엇인가요?")
            }
            
            HStack {
                TextField("Search", text: $search)
                    .padding(.leading, 30)
                    .onChange(of: search) { newValue in
                        clubDataManager.findClubsByWord(word: newValue)
                    }
                
            } //: HSTACK
            .frame(width: 327, height: 36, alignment: .center)
            .background(Color.grayBackground)
            .cornerRadius(12)
            .padding(.horizontal)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                }.padding(.leading, 24)
            )
            
            // MARK: - CENTER, CARD GRID
            ScrollView {
                if clubDataManager.selectedClub.count > 0 {
                    LazyVGrid(columns: columns) {
                        ForEach(clubDataManager.selectedClub, id: \.?.name) { club in
                            NavigationLink(destination: DescriptionView()) {
                                ClubCardView(clubModel: (club)!)
                            }
                        }
                    }
                    .padding()
                } else {
                    Text("없음.")
                }
            } //: SCROLL
        } //: VSTACK
        .navigationBarHidden(true)
        .onAppear{
            clubDataManager.findClubsByWord(word: search)
        }
    }
}
