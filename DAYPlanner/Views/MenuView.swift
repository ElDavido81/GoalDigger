//
//  MenuView.swift
//  DAYPlanner
//
//  Created by David Kalitzki on 2026-01-23.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var blurGridLayer: Bool

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            LiquidView()
            Spacer()
            AddTaskButtonView(blurGridLayer: $blurGridLayer)
        }
        

    }
}

#Preview {
    MenuView(blurGridLayer: .constant(false) )

}
