//
//  SearchView.swift
//  PocketCaddy
//
//  Created by LeeJaehoon on 2022/06/11.
//

import SwiftUI


extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct SearchView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var clubDataManager: ClubDataManager
    @State private var search: String = ""
    @State var isViewActive: Bool = false
    @State var selectedClub: ClubModel? = nil
    @State var isPressed = false
    
    @Binding var isAllClubActive: Bool
    
    @GestureState var longPressTap = false
    
    let buttonWidth = UIScreen.main.bounds.height * 0.03
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @State private var nowY: CGFloat = 0
    @State private var geoMinY: CGFloat = 0
    @State private var isAnimation: Bool = true
    @State private var proxyReader2: ScrollViewProxy? = nil
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if clubDataManager.searchSelectedClub != nil {
                DescriptionPageView(goBack: $isViewActive)
                    .transition(.opacity)
                    .navigationBarHidden(true)
                
            } else {
                // MARK: - CENTER, CARD GRID
                ScrollViewReader { proxyReader in
                    
                    ScrollView (showsIndicators: false) {
                        
                        Spacer().frame(height: Screen.height * 0.12)
                            .overlay(
                                GeometryReader { geo in
                                    Rectangle()
                                        .frame(width: 0, height: 0)
                                        .onAppear(perform: {
                                            self.nowY = geo.frame(in: .global).midY
                                            self.geoMinY = geo.frame(in: .global).midY
                                            // 비교하기위한 초기값이랑, 프레임 높이 사이즈(min, max) 알아야함.
                                        })
                                        .onChange(of: geo.frame(in: .global).midY) { midY in
                                            
                                            if midY < self.geoMinY {
                                                if self.nowY > midY && self.isAnimation == true {
                                                    // Down
                                                    self.isAnimation = false
                                                    hideKeyboard()
                                                } else if self.nowY < midY && self.isAnimation == false {
                                                    // Up
                                                    self.isAnimation = true
                                                    hideKeyboard()
                                                } else {
                                                }
                                                self.nowY = midY
                                            }
                                            
                                        }
                                    
                                }
                            )
                            .id("Scroll_To_Top")
                            .onAppear(perform: {
                                self.proxyReader2 = proxyReader
                            })
                        
                        if clubDataManager.selectedClub.count > 0 {
                            LazyVGrid(columns: columns) {
                                ForEach(clubDataManager.selectedClub, id: \.?.name) { club in
                                    Button(action: {
                                        DispatchQueue.main.async {
                                            clubDataManager.searchSelectedClub = club
                                        }

                                        hideKeyboard()
                                                                                
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
                } //: SCROLL VIEW READER
                
                // MARK: - HEADER
                VStack {
                    VStack {
                        Spacer().frame(height: 50)
                        
                        HStack {
                            TextField("Search", text: $search)
                                .padding(.horizontal, 30)
                                .onChange(of: search) { newValue in
                                    clubDataManager.findClubsByWord(word: newValue)
                                }
                            
                        } //: HSTACK
                        .frame(width: Screen.width * 0.9, height: 36, alignment: .center)
                        .background(Color.primaryGray)
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
                                        withAnimation(.default) {
                                            self.proxyReader2!.scrollTo("Scroll_To_Top", anchor: .top)
                                        }
                                    }
                            }.padding(.horizontal, 24)
                        )
                        .onTapGesture {
                            withAnimation(.default) {
                                self.proxyReader2!.scrollTo("Scroll_To_Top", anchor: .top)
                            }
                        }
                        .padding(.bottom, Screen.height * 0.012)
                    } // VSTACK
                    .background(.bar)
                    .offset(y: self.isAnimation ? 0 : -10)
                    .opacity(self.isAnimation ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: self.isAnimation)
                    
                    Spacer()
                    
                } //: VSTACK HEADER SEARCH BAR
                
                VStack {
                    HStack {
                        CustomBackButtonGoBack(isViewActive: $isAllClubActive)
                        
                        Text("\(Image(systemName: "magnifyingglass"))  \(search.isEmpty ? String("    "): search)")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 14))
                            .background(Capsule().fill(Color.primaryGray))
                            .padding(.trailing, Screen.width * 0.058)
                            .onTapGesture {
                                self.isAnimation = true
                                withAnimation(.default) {
                                    self.proxyReader2!.scrollTo("Scroll_To_Top", anchor: .top)
                                }
                            }
                            .opacity(self.isAnimation ? 0 : 1)
                            .animation(.easeOut(duration: 0.3), value: self.isAnimation)
                    }
                    .background(.bar)
                    
                    Spacer()
                    
                } //: VSTACK HEADER BACK BUTTON
                
            } //: else
            
        } //: ZSTACK
        .navigationBarHidden(true)
        .onAppear {
            clubDataManager.findClubsByWord(word: search)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
