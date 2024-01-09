//
//  ContentView.swift
//  War Card Game
//
//  Created by Jev Smolnikov on 08/01/2024.
//

import SwiftUI

struct ContentView: View {
  
  @State var playerCard = "back"
  @State var cpuCard = "back"
  
  @State var playerScore = 0
  @State var cpuScore = 0
  
  var body: some View {
    
    ZStack {
      Image("background-plain")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
      VStack {
          Image("logo")
            .padding(.bottom, 40)
        
          HStack {
            Spacer()
            Image(playerCard)
            Spacer()
            Image(cpuCard)
            Spacer()
          }
            .padding(.bottom, 40)
        
          Button(action: {
            dealCards()
          }, label: {
            Image("button")
          })
            .foregroundColor(.white)
            .padding(.bottom, 30)
          
          HStack {
            Spacer()
            VStack {
              Text("Player")
                .font(.headline)
                .padding(.bottom, 5.0)
              Text(String(playerScore))
                .font(.largeTitle)
            }
            Spacer()
            VStack {
              Text("CPU")
                .font(.headline)
                .padding(.bottom, 5.0)
              Text(String(cpuScore))
                .font(.largeTitle)
            }
            Spacer()
          }
            .foregroundColor(.white)
      }
    }
  }
  
  func dealCards() {
    let playerRandomNumber = Int.random(in: 2...14)
    let cpuRandomNumber = Int.random(in: 2...14)
    
    playerCard = "card" + String(playerRandomNumber)
    cpuCard = "card" + String(cpuRandomNumber)
    
    if playerRandomNumber > cpuRandomNumber {
      playerScore += 1
    }
    else if cpuRandomNumber > playerRandomNumber {
      cpuScore += 1
    }
    else {
      playerScore = 0
      cpuScore = 0
    }
  }
}

#Preview {
  ContentView()
}
