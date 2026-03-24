//
//  TestView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2025-12-29.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var blurGridLayer: Bool = false
    
    var body: some View {
//        StartView()
//        GridView(blurGridLayer: $blurGridLayer)
        SignInView()
//        SignUpView()
//        GameView(blurGridLayer: $blurGridLayer)
//        DBTestView()
    }

}

#Preview {
    ContentView()
}
