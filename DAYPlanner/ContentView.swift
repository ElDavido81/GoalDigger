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

//        GridView(blurGridLayer: $blurGridLayer)
SignUpView()
    }

}

#Preview {
    ContentView()
}
