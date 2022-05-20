//
//  ContentView.swift
//  Shared
//
//  Created by Jackson Cuevas on 5/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game).padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(sliderValue: $sliderValue, alertIsVisible: $alertIsVisible, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(sliderValue: $sliderValue, alertIsVisible: $alertIsVisible, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nput the bulleye as close as you can to")
                .padding(.leading,30.0)
                .padding(.trailing,30.0)

            BigNumberText(text: String(game.target))
             
        }
    }
}

struct HitMeButton: View {
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    @Binding var game: Game

    var body: some View {
        Button {
            withAnimation{
                alertIsVisible = true
            }
          
        } label: {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
            Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(
                    colors: [Color.white.opacity(0.3), Color.clear]),
                    startPoint: .top, endPoint: .bottom
                )
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        } .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView().preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
