//
//  ContentView.swift
//  Next Track
//
//  Created by Aleksey Sabantsev on 05.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    @State private var isChanged = false
    
    var body: some View {
        Button {
            isTapped = false
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                isTapped = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isChanged = true
            }
        } label: {
            HStack(spacing: 0) {
                play
                    .frame(maxWidth: isTapped ? 40 : 0)
                    .opacity(isTapped ? 1 : 0)
                play
                    .frame(maxWidth: 40)
                play
                    .frame(maxWidth: isTapped ? 0 : 40)
                    .opacity(isTapped ? 0 : 1)
            }
            .frame(maxWidth: 80)
        }
    }
    
    var play: some View {
        Image(systemName: "play.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
