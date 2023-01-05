//
//  TitleText.swift
//  WordsGame
//
//  Created by Виктор Куля on 05.01.2023.
//

import SwiftUI

struct TitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .foregroundColor(.white)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(text: "Achivements")
    }
}
