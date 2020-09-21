//
//  ContentView.swift
//  Guess the Country
//
//  Created by Surya Chappidi on 10/07/20.
//  Copyright © 2020 Surya Chappidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack(spacing:10) {
                Text("Tap the flag of")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(countries[correctAnswer])
                .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
            }
            ForEach(0 ..< 3){ number in
                Button(action: {
                    self.flagTapped(number)
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
                    }
                }
            }
            .alert(isPresented: $showingScore){
                Alert(title: Text(scoreTitle), message: Text("Your Score is ???"), dismissButton: .default(Text("Continue")){
                    self.askQuestion()
                    })
            }
        }
    }
    
    func flagTapped(_ number:Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
