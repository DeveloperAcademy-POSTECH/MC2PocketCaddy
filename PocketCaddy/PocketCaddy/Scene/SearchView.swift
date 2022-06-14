//
//  SearchView.swift
//  PocketCaddy
//
//  Created by LeeJaehoon on 2022/06/11.
//

import SwiftUI

struct SearchView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var clubDataManager: ClubDataManager
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State private var search: String = ""
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .foregroundColor(.primaryGreen)
                }.frame(width: Screen.height * 0.03 , height: Screen.height * 0.025)
                .padding([.top, .leading])
                
                Spacer()
            }
            
            HStack {
                Text("\(Text("어떤 채의 정보").foregroundColor(.primaryGreen))가\n궁금하신가요?")
                    .font(.system(size: Screen.width * 0.09, weight: .bold))
                Spacer()
            }
            .frame(idealWidth: Screen.width, minHeight: 70, idealHeight: Screen.height * 0.118)
            .padding([.leading, .bottom], Screen.height * 0.02)
            
            HStack {
                TextField("Search", text: $search)
                    .padding(.horizontal, 30)
                    .onChange(of: search) { newValue in
                        clubDataManager.findClubsByWord(word: newValue)
                    }
                
            } //: HSTACK
            .frame(width: Screen.width * 0.838, height: 36, alignment: .center)
            .background(Color.backgroundWhite)
            .cornerRadius(12)
            .padding(.horizontal)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.gray)
                        .opacity(search.isEmpty ? 0 : 1)
                        .onTapGesture {
                            search = ""
                        }
                }.padding(.horizontal, 24)
            )
            
            // MARK: - CENTER, CARD GRID
            ScrollView {
                if clubDataManager.selectedClub.count > 0 {
                    LazyVGrid(columns: columns) {
                        ForEach(clubDataManager.selectedClub, id: \.?.name) { club in
                            NavigationLink(destination: DescriptionPageView()) {
                                ClubCardView(clubModel: (club)!)
                            }
                        }
                    }
                    .padding()
                } else {
                    VStack {
                        Text("찾으시는")
                        Text("채의 정보가")
                        Text("없습니다")
                    }
                    .font(.system(size: Screen.width * 0.09, weight: .bold))
                    .offset(y: Screen.height * 0.15)
                    
                }
            } //: SCROLL
        } //: VSTACK
        .navigationBarHidden(true)
        .onAppear{
            clubDataManager.findClubsByWord(word: search)
        }
    }
}
