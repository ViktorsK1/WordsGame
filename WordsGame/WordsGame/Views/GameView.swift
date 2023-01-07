//
//  GameView.swift
//  WordsGame
//
//  Created by Виктор Куля on 05.01.2023.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    
    var body: some View {
        
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Quit")
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
            
            Text("SomeTherapy")
                .font(.custom("AvenirNext-Bold",
                              size: 36))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Viktor")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2,
                       height: screen.width / 2.2)
                .background(Color("FirstPlayer"))
                .cornerRadius(26)
                .shadow(color: .red,
                        radius: 4,
                        x: 0,
                        y: 0)
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Yuliia")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }
                .padding(20)
                .frame(width: screen.width / 2.2,
                       height: screen.width / 2.2)
                .background(Color("SecondPlayer"))
                .cornerRadius(26)
                .shadow(color: .purple,
                        radius: 4,
                        x: 0,
                        y: 0)
            }
            WordsTextField(word: $word,
                           placeholder: "Your word ...")
            .padding(.horizontal)
            
            Button {
                print("Ready")
                self.word = ""
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
                
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .background(Image("background"))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
