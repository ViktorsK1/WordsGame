//
//  GameView.swift
//  WordsGame
//
//  Created by Виктор Куля on 05.01.2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    var viewModel: GameViewModel
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
                } label: {
                    Text("Quit")
                        .padding(6)
                        .padding(.horizontal)
                        .background(Color("Orange"))
                        .cornerRadius(12)
                        .padding(6)
                        .foregroundColor(.white)
                        .font(.custom("AvenirNext-Bold",
                                      size: 18))
                }
                
                Spacer()
            }
            
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold",
                              size: 30))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.player1.name)")
                        .minimumScaleFactor(0.5)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2,
                       height: screen.width / 2.2)
                .background(Color("FirstPlayer"))
                .cornerRadius(26)
                .shadow(color: viewModel.isFirst ? .red : .clear,
                        radius: 4,
                        x: 0,
                        y: 0)
                
                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("\(viewModel.player2.name)")
                        .minimumScaleFactor(0.5)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2,
                       height: screen.width / 2.2)
                .background(Color("SecondPlayer"))
                .cornerRadius(26)
                .shadow(color: viewModel.isFirst ? .clear : .purple,
                        radius: 4,
                        x: 0,
                        y: 0)
            }
            WordsTextField(word: $word,
                           placeholder: "Your word ...")
            .padding(.horizontal)
            
            Button {
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "Create a new word, which wasn't created before!"
                    isAlertPresent.toggle()
                } catch WordError.littleWord {
                    alertText = "A word is too short!"
                    isAlertPresent.toggle()
                } catch WordError.theSameWord {
                    alertText = "The created word shouldn't be outcomming word!"
                    isAlertPresent.toggle()
                } catch WordError.wrongWord {
                    alertText = "This word can't be created"
                    isAlertPresent.toggle()
                } catch {
                    alertText = "Unknown error"
                    isAlertPresent.toggle()
                }
                
                if score > 1 {
                    self.word = ""
                }
                
            } label: {
                Text("Ready!")
                    .padding(12)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color("Orange"))
                    .cornerRadius(12)
                    .font(.custom("AvenirNext-Bold",
                                  size: 26))
                    .padding(.horizontal)
            }
            
            List {
                ForEach(0 ..< self.viewModel.words.count, id: \.description) { item in
                    WordCell(word: self.viewModel.words[item])
                        .listRowInsets(EdgeInsets())
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .background(Image("background"))
        .confirmationDialog("Are you sure you want to end the game?",
                            isPresented: $confirmPresent,
                            titleVisibility: .visible) {
            Button(role: .destructive) {
                self.dismiss()
            } label: {
                Text("Yes")
            }
            
            Button(role: .cancel) { } label: {
                Text("No")
            }
        }
        .alert(alertText,
               isPresented: $isAlertPresent) {
               Text("Ok, understand...")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "FirstPlayer"),
                                          player2: Player(name: "SecondPlayer"),
                                          word: "Mountain"))
    }
}
