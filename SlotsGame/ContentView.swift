//
//  ContentView.swift
//  SlotsGame
//
//  Created by Andrea on 17-03-22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var images = ["apple", "cherry", "star"]
    @State private var numbers = [0, 1, 2]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var credits = 1000
    private var betAmount = 10
    
    var body: some View {
        ZStack {
            //Background
            //Back
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(.all)
            //Top
            Rectangle().foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            
            VStack {
            
            Spacer()
            
            //Title
            HStack {
                Image(systemName: "star.fill").foregroundColor(.blue)
                Text("Slots Game").bold()
                Image(systemName: "star.fill").foregroundColor(.blue)
            }.scaleEffect(2)
            
            Spacer()
            
            //Counter
            Text("Credits: " + String(credits))
                .foregroundColor(.black)
                .padding(.all, 10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            
            Spacer()
            
            //Slots
            HStack {
                Spacer()
                
                ImageView(image: $images[numbers[0]], background: $backgrounds[0])
                
                ImageView(image: $images[numbers[1]], background: $backgrounds[1])
                
                ImageView(image: $images[numbers[2]], background: $backgrounds[2])
                
                Spacer()
            }
            
            Spacer()
            
            //Button
            Button(action: {
                //Background
                self.backgrounds = self.backgrounds.map { _ in Color.white }
                
                //Spin
                self.numbers = self.numbers.map { _ in Int.random(in: 0...self.images.count - 1)}
                
                //Win
                if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                    self.credits += self.betAmount * 10
                        self.backgrounds = self.backgrounds.map { _ in Color.green }
                }
                else {
                    self.credits -= self.betAmount
                }
            }) {
                Text("Play!")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 30)
                    .background(Color.red)
                    .cornerRadius(20)
            }
            
            Spacer()
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
