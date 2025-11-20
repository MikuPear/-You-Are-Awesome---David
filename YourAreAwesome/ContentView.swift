//
//  ContentView.swift
//  YourAreAwesome
//
//  Created by GARCIA-MARTINEZ, DAVID on 11/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = 0 // lastMessageNumber will never be -1
    @State private var lastImageNumber = 0
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "You Are Fantastic!",
                                "Fabulous? That's You!",
                                "You Make Me Smile!"]
                
                // generate a random messageNumber to use as an index
                // if messageNumber == lastMessageNumber {
                //    keep generating a new random messageNumber
                //    until you get a messageNumber != lastMessageNumber
                // set messageString to messages[messageNumber]
                // update the lastMessageNumber with messageNumber
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 1...9)
                repeat {
                    imageNumber = Int.random(in: 1...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

