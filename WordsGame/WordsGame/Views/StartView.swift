//
//  ContentView.swift
//  WordsGame
//
//  Created by Виктор Куля on 05.01.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShowedGame = false

    
    var body: some View {
        
        VStack {

            TitleText(text: "WordsGame")
            
            WordsTextField(word: $bigWord, placeholder: "Put a long word")
                .padding(20)
                .padding(.top, 32)
             
            WordsTextField(word: $player1, placeholder: "Player 1")
                .cornerRadius(12)
                .padding(.horizontal, 20)

            WordsTextField(word: $player2, placeholder: "Player 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                print("Start button tapped")
                isShowedGame.toggle()
            } label: {
                Text("Start")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(100)
                    .padding(.top)
            }
        }.background(Image("background"))
            .fullScreenCover(isPresented: $isShowedGame) {
                let player1 = Player(name: self.player1)
                let player2 = Player(name: self.player2)
                
                let gameViewModel = GameViewModel(player1: player1, player2: player2, word: bigWord)

                GameView(viewModel: gameViewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
