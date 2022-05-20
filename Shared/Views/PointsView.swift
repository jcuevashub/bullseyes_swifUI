//
//  PointsView.swift
//  bullseyes_swifUI (iOS)
//
//  Created by Jackson Cuevas on 5/20/22.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(roundedValue) Points\n🎉🎉🎉")
            
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
                
            }) {
                ButtonText(text: "Start New Round")
            }
        }.padding()
         .frame(maxWidth: 300)
         .background(Color("BackgroundColor"))
         .cornerRadius(21.0)
         .shadow(radius: 10, x: 5, y: 5)
         .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game)
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game).previewLayout(.fixed(width: 568, height: 320))
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game).preferredColorScheme(.dark)
        PointsView(sliderValue: sliderValue, alertIsVisible: alertIsVisible, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
