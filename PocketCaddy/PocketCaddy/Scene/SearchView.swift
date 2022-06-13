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
                }.frame(width: buttonWidth, height: buttonWidth)
                .padding([.top, .leading])
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text("\(Text("어떤 채의 정보").foregroundColor(.primaryGreen))가\n궁금하신가요?")
                    .frame(width: 300, height: 100, alignment: .leading)
                    .font(.system(size: Screen.width * 0.09, weight: .bold))
            }
            .padding(.bottom, Screen.height * 0.03)
            
            HStack {
                TextField("Search", text: $search)
                    .padding(.leading, 30)
                    .onChange(of: search) { newValue in
                        clubDataManager.findClubsByWord(word: newValue)
                    }
                
            } //: HSTACK
            .frame(width: 327, height: 36, alignment: .center)
            .background(Color.backgroundWhite)
            .cornerRadius(12)
            .padding(.horizontal)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    Image(systemName: "xmark.circle")
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
