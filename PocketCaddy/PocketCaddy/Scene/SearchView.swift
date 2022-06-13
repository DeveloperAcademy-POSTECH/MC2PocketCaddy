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
