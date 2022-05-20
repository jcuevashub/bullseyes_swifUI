//
//  RoundViews.swift
//  bullseyes_swifUI (iOS)
//
//  Created by Jackson Cuevas on 5/19/22.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                                      lineWidth: 1.0)
            )
    }
}
struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
          
    }
}

struct PreviewViews: View {
    var body: some View {
        VStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
        }
     
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewViews()
        PreviewViews().preferredColorScheme(.dark)
    }
}
