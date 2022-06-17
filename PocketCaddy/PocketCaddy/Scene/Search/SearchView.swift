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
    @State private var search: String = ""
    @State var isViewActive: Bool = false
    @State var selectedClub: ClubModel?
    @State var isPressed = false
    
    @Binding var isAllClubActive: Bool
    
    @GestureState var longPressTap = false

    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - CENTER, CARD GRID
            if selectedClub != nil {
                DescriptionSingleView(selectedClub: selectedClub, isViewActive: $isViewActive)
                    .transition(.opacity)
                    .onChange(of: isViewActive) { _ in
                        withAnimation {
                            self.selectedClub = nil
                        }
                    }
            } else {
                // MARK: - HEADER
                CustomBackButtonGoBack()
                    .transition(.opacity)
                    .opacity(longPressTap ? 0.4 : 1.0)
                    .gesture(
                        LongPressGesture(minimumDuration: 1000000)
                            .updating($longPressTap, body: { (currentState, state, transaction) in
                                state = currentState
                            })
                    )
                    .simultaneousGesture(TapGesture()
                        .onEnded { _ in
                            withAnimation {
                                self.isAllClubActive = false
                            }
                        })
                HStack {
                    TextField("Search", text: $search)
                        .padding(.horizontal, 30)
                        .onChange(of: search) { newValue in
                            clubDataManager.findClubsByWord(word: newValue)
                        }
                    
                } //: HSTACK
                .frame(width: Screen.width * 0.9, height: 36, alignment: .center)
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

                ScrollView (showsIndicators: false) {
                    if clubDataManager.selectedClub.count > 0 {
                        LazyVGrid(columns: columns) {
                            ForEach(clubDataManager.selectedClub, id: \.?.name) { club in
                                Button(action: {
                                    withAnimation {
                                        self.isViewActive = true
                                        self.selectedClub = club
                                    }
                                }) {
                                    ClubCardView(clubModel: (club)!)
                                }
                            }
                        }
                        .padding()
                    } else {
                        VStack {
                            Image(systemName: "exclamationmark.circle")
                                .font(.system(size: 50, weight: .ultraLight, design: .default))
                                .padding(.bottom, 2)
                            Text("검색 결과가 없습니다")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .foregroundColor(.gray)
                        .padding(.top, Screen.height * 0.3)
                    }
                } //: SCROLL
            }

        } //: VSTACK
        .navigationBarHidden(true)
        .onAppear {
            clubDataManager.findClubsByWord(word: search)
        }
    }
}
